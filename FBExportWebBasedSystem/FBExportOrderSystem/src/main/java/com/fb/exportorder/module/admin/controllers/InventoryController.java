package com.fb.exportorder.module.admin.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fb.exportorder.models.Product;
import com.fb.exportorder.models.enums.ProductStatus;
import com.fb.exportorder.module.admin.service.InventoryService;
import com.fb.exportorder.utilities.DeleteImage;
import com.fb.exportorder.utilities.UploadImage;


@Controller
public class InventoryController {
	
	@Autowired
	private InventoryService inventoryService;
	
	@RequestMapping("/admin/inventory")
	public String inventory (Model model) {
		
		model.addAttribute(inventoryService.getAllProducts());
		
		return "inventory";
	}
	
	@RequestMapping(value = "/admin/add-product", method = RequestMethod.GET)
	public String addProduct () {
		return "add-product";
	}
	
	@RequestMapping(value = "/admin/add-product/add-preview-images", method = RequestMethod.POST)
	@ResponseBody
	public void addPreviewImages (@RequestParam("qqfile") MultipartFile previewImage,
            @RequestParam("qquuid") String uuid,
            @RequestParam("qqfilename") String fileName,
            @RequestParam(value = "qqpartindex", required = false, defaultValue = "-1") int partIndex,
            @RequestParam(value = "qqtotalparts", required = false, defaultValue = "-1") int totalParts,
            @RequestParam(value = "qqtotalfilesize", required = false, defaultValue = "-1") long totalFileSize,
																 HttpServletResponse response) throws IOException {
		
		  String uploadedFilename = UploadImage.uploadProductImage(uuid, previewImage);

		  System.out.println("uploading: " + previewImage.getOriginalFilename());
		  System.out.println("uuid " + uuid);
		
		  JSONObject json1 = new JSONObject(); 
          
		  json1.put("success", true);
		  json1.put("productImageLink", uploadedFilename);
          response.setCharacterEncoding("UTF-8");
          response.setContentType("text/plain");
          response.getWriter().print(json1);
          response.flushBuffer();
		
	}
	
	private String validateProduct (String productJSONString, boolean update) {
		
		List<String> errorMessages = null;
		
		try {
			
			JSONObject jsonRawObject = (JSONObject)new JSONParser().parse(productJSONString);
		
		
			errorMessages = inventoryService.validate((String)jsonRawObject.getOrDefault("isImageEmpty", StringUtils.EMPTY), 
													  (String)jsonRawObject.get("name"), 
													  (String)jsonRawObject.get("origin"), 
													  (String)jsonRawObject.get("deliveryDate"), 
													  (String)jsonRawObject.get("price"), 
													  (String)jsonRawObject.get("weight"), 
													  (String)jsonRawObject.get("description"), 
													  (String)jsonRawObject.get("supplier"), 
													  (String)jsonRawObject.get("supplierContactNumber"), 
													  (String)jsonRawObject.get("supplierAddress"),
													  update);	
			
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONObject validateResponse = new JSONObject();
		
		if (errorMessages.isEmpty()) {
			validateResponse.put("status", "success");
		} else {
			validateResponse.put("status", "error");
			validateResponse.put("message", errorMessages.get(0));
		}
		
		return validateResponse.toJSONString();
	}
	
	@RequestMapping(value = "/admin/add-product/validate", method = RequestMethod.POST)
	@ResponseBody
	public String validateAdd(@RequestParam String productJSONString) {
		return validateProduct(productJSONString, false);
	}
	
	@RequestMapping(value = "/admin/add-product/delete-preview-images/{qquuid}",
		        	method = { RequestMethod.DELETE })
	public void deletePreviewImages(
		        HttpServletRequest request,
		        HttpServletResponse response,
		        @PathVariable("qquuid") String qquuid,
		        @RequestParam("filename") String filename) throws IOException {
		
			System.out.println("uploadDelete() called " + filename);
			
			DeleteImage.deleteProductImage(qquuid);
			
			response.setStatus(200);
			response.flushBuffer();
			
	}
	
	@RequestMapping(value = "/admin/add-product/add", method = RequestMethod.POST)
	public String addProductAdd (@RequestParam(name = "product-image", required = false) MultipartFile productImage,
							   @RequestParam("product-name") String productName,
							   @RequestParam String origin,
							   @RequestParam("delivery-date") String deliveryDate,
							   @RequestParam String price,
							   @RequestParam String weight,
							   @RequestParam String description,
							   @RequestParam String supplier,
							   @RequestParam("supplier-contact-number") String 	supplierContactNumber,
							   @RequestParam("supplier-address") String supplierAddress,
							   @RequestParam(name = "post-this-product", required = false) String postThisProduct,
							   @RequestParam("profileImageLinks[]") List<String> profileImageLinks,
							   RedirectAttributes attributes) {
		
		  for (String profileImageLink : profileImageLinks)
			  System.out.println(profileImageLink);
		
		  inventoryService.addProduct(productImage, productName, origin, deliveryDate, price, weight, description, supplier, supplierContactNumber, supplierAddress, postThisProduct, profileImageLinks);
		  
		  attributes.addFlashAttribute("successMessage", "Product has been added");
		  
		  return "redirect:/admin/inventory";
          
	}
	
	@RequestMapping(value = "/admin/inventory/get-product-details", method = RequestMethod.POST)
	@ResponseBody
	public Product getProductDetails(@RequestParam String id) {
		return inventoryService.getProductById(Long.parseLong(id));
	}
	
	@RequestMapping(value = "/admin/inventory/addstock-product", method = RequestMethod.POST)
	@ResponseBody
	public String deleteProduct(@RequestParam String id,
								@RequestParam String weight) {
		return inventoryService.updateStockProduct(Long.parseLong(id), weight);
	}

	@RequestMapping(value = "/admin/inventory/post-product", method = RequestMethod.POST)
	@ResponseBody
	public String postProduct(@RequestParam String id) {
		return inventoryService.postProduct(Long.parseLong(id));
	}
	
	@RequestMapping(value = "/admin/inventory/unpost-product", method = RequestMethod.POST)
	@ResponseBody
	public String unpostProduct(@RequestParam String id) {
		inventoryService.unpostProduct(Long.parseLong(id));
		return "";
	}
	
	@RequestMapping(value = "/admin/inventory/filter-products", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> filterProducts(@RequestParam String filterData) throws java.text.ParseException, ParseException {
		
		JSONObject filterDataJSON = (JSONObject)new JSONParser().parse(filterData);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		String strStatus = (String)filterDataJSON.get("status");
		
		ProductStatus status = strStatus.equals("Posted") ?  ProductStatus.POSTED :
							   strStatus.equals("Unposted") ? ProductStatus.UNPOSTED : 
							   strStatus.equals("Outofstock") ? ProductStatus.OUT_OF_STOCK : ProductStatus.ALL;;
		
		double minPrice = StringUtils.isBlank((String)filterDataJSON.get("minPrice")) ? 0 : 
																						Double.parseDouble((String)filterDataJSON.get("minPrice"));
		
		double maxPrice = StringUtils.isBlank((String)filterDataJSON.get("maxPrice")) ? 0 : 
																					    Double.parseDouble((String)filterDataJSON.get("maxPrice"));
		
		double minWeight = StringUtils.isBlank((String)filterDataJSON.get("minWeight")) ? 0 : 
		    																			Double.parseDouble((String)filterDataJSON.get("minWeight"));
		
		double maxWeight = StringUtils.isBlank((String)filterDataJSON.get("maxWeight")) ? 0 : 
																						Double.parseDouble((String)filterDataJSON.get("maxWeight"));
		
		Date minDate = (StringUtils.isNotBlank((String)filterDataJSON.get("minDate"))) ? dateFormat.parse((String)filterDataJSON.get("minDate")) :
																						 new Date();
		
		Date maxDate = (StringUtils.isNotBlank((String)filterDataJSON.get("maxDate"))) ? dateFormat.parse((String)filterDataJSON.get("maxDate")) :
			 																			 new Date();
		
		String dateFilterType = (String)filterDataJSON.get("dateFilterType");
	
		return inventoryService.filterProducts(minDate,
											   maxDate,
											   dateFilterType,
											   status,
											   minPrice,
											   maxPrice,
											   minWeight,
											   maxWeight);
		
	}

	@RequestMapping("/admin/inventory/edit-product/{product-id}")
	public String editProduct(@PathVariable("product-id") String productId,
														  Model model) {
		
		
		Product editedProduct = inventoryService.getProductById(Long.parseLong(productId));
		
		if (Objects.nonNull(editedProduct)) {
			model.addAttribute(editedProduct);
			return "edit-product";
		}
		
		return "redirect:/error";
	}
	
	@RequestMapping(value = "/admin/inventory/edit-product/{product-id}/edit", method = RequestMethod.POST)
	public String editProductEdit(@PathVariable("product-id") String productId,
								  @RequestParam(name = "product-image") MultipartFile productImage,
								  @RequestParam("product-name") String productName,
								  @RequestParam String origin,
								  @RequestParam("delivery-date") String deliveryDate,
								  @RequestParam String price,
								  @RequestParam String weight,
								  @RequestParam String description,
								  @RequestParam String supplier,
								  @RequestParam("supplier-contact-number") String 	supplierContactNumber,
								  @RequestParam("supplier-address") String supplierAddress,
								  @RequestParam("profileImageLinks") MultipartFile[] previewImages,
								  RedirectAttributes attributes) {
		
		inventoryService.editProduct(Long.parseLong(productId), 
									 productImage, 
									 productName, 
									 origin, 
									 deliveryDate, 
									 price, 
									 weight, 
									 description, 
									 supplier, 
									 supplierContactNumber, 
									 supplierAddress, 
									 previewImages);
	
		attributes.addFlashAttribute("successMessage", "Product Successfully edited");
		
		return "redirect:/admin/inventory";
	}
	
	@RequestMapping(value = "/admin/edit-product/validate", method = RequestMethod.POST)
	@ResponseBody
	public String validateEdit(@RequestParam String productJSONString) {
		return validateProduct(productJSONString, true);
	}
	
}

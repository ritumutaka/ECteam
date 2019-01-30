package com.internousdev.anemone.dto;

import java.util.Date;

public class ProductInfoDTO {

	private  int	productIdNumber;			//商品Id
	private  String	productName;				//商品名
	private  String	productNameKana;			//商品名ふりがな
	private  String productDescription;			//商品詳細説明
	private  int	productCategoryId;			//カテゴリー番号
	private  int	productPrice;				//商品１つあたりの価格
	private  String	productImageFilePath;		//商品画像のファイルパス
	private  String	productImageFileName;		//商品画像の名前
	private  Date	productReleaseDate;			//発売された日付
	private  String	productReleaseCompany;		//発売した会社名
	private  int	productStatus;				//有効にするかどうか
	private  Date	productRegistDate;			//商品として登録された日付
	private  Date	productUpdateDate;			//商品情報が更新された日付

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductPrice() {
		return this.productPrice;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public int getProductCategoryId() {
		return this.productCategoryId;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductDescription() {
		return this.productDescription;
	}

	public void setProductIdNumber(int productIdNumber) {
		this.productIdNumber = productIdNumber;
	}

	public int getProductIdNumber() {
		return this.productIdNumber;
	}


	public void setProductUpdateDate(Date productUpdateDate) {
		this.productUpdateDate = productUpdateDate;
	}

	public Date getProductUpdateDate() {
		return this.productUpdateDate;
	}

	public void setProductRegistDate(Date productRegistDate) {
		this.productRegistDate = productRegistDate;
	}

	public Date getProductRegistDate() {
		return this.productRegistDate;
	}

	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}

	public int getProductStatus() {
		return this.productStatus;
	}

	public void setProductReleaseCompany(String productReleaseCompany) {
		this.productReleaseCompany = productReleaseCompany;
	}

	public String getProductReleaseCompany() {
		return this.productReleaseCompany;
	}

	public Date getProductReleaseDate() {
		return productReleaseDate;
	}
	public void setProductReleaseDate(Date productReleaseDate) {
		this.productReleaseDate = productReleaseDate;
	}

	public void setProductImageFileName(String productImageFileName) {
		this.productImageFileName = productImageFileName;
	}

	public String getProductImageFileName() {
		return this.productImageFileName;
	}

	public void setProductImageFilePath(String productImageFilePath) {
		this.productImageFilePath = productImageFilePath;
	}

	public String getProductImageFilePath() {
		return this.productImageFilePath;
	}

	public void setProductNameKana(String productNameKana) {
		this.productNameKana = productNameKana;
	}

	public String getProductNameKana() {
		return this.productNameKana;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductName() {
		return this.productName;
	}

}

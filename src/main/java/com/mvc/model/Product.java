package com.mvc.model;


import java.io.Serializable;
import java.sql.Blob;

public class Product implements Serializable{
	private int id;
	private String productname;
	private int price;
	private String description;
	private String category;
	private Blob data;
	private String encode;
	public Product(int id,String productname, int price, String description, String category, Blob data, String encode) {
		super();
		this.id=id;
		this.productname = productname;
		this.price = price;
		this.description=description;
		this.category=category;
		this.data=data;
		this.encode=encode;
	}
	public Product() {
		super();

	}
	
	public String getEncode() {
		return encode;
	}
	public void setEncode(String encode) {
		this.encode = encode;
	}
	public Blob getData() {
		return data;
	}
	public void setData(Blob data) {
		this.data = data;
	}
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", productname=" + productname + ", price=" + price + ", description="
				+ description + ", category=" + category + ", data=" + data + ", encode=" + encode + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((encode == null) ? 0 : encode.hashCode());
		result = prime * result + id;
		result = prime * result + price;
		result = prime * result + ((productname == null) ? 0 : productname.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (encode == null) {
			if (other.encode != null)
				return false;
		} else if (!encode.equals(other.encode))
			return false;
		if (id != other.id)
			return false;
		if (price != other.price)
			return false;
		if (productname == null) {
			if (other.productname != null)
				return false;
		} else if (!productname.equals(other.productname))
			return false;
		return true;
	}
	
	
}
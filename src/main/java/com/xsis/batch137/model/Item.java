package com.xsis.batch137.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.NotNull;


@Entity
@Table(name="pos_mst_item")
public class Item {	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private Long id;
	
	@Size(max=255)
	private String name;
	
	@JoinColumn(name="created_by")
	@ManyToOne
	private User createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@JoinColumn(name="x_by")
	@ManyToOne
	private User modifiedBy;
	
	@Column(name="modified_on")
	private Date modifiedOn;
	
	@NotNull
	private Boolean active;
	
	//relation to category
	@ManyToOne
	private Category category;
	
	//relation to itemvariant	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="item",cascade=CascadeType.ALL,orphanRemoval=true)
	private List<ItemVariant> itemVariants;

	private String image;
	
	@Transient
	List<Long> updateActive = new ArrayList<Long>();
	
	public List<Long> getUpdateActive() {
		return updateActive;
	}

	public void setUpdateActive(List<Long> updateActive) {
		this.updateActive = updateActive;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public User getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(User modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}



	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public List<ItemVariant> getItemVariants() {
		return itemVariants;
	}

	public void setItemVariants(List<ItemVariant> itemVariants) {
		this.itemVariants = itemVariants;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
}

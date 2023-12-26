package base.dtos;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

public class DonateRequestDTO implements Serializable{
	
	private int id;
	private String name;
	private String imagePath;
	private String description;
	private Date createDate;
	private  int donatesector_id;
	private String donatesector_name;
	public String getDonatesector_name() {
		return donatesector_name;
	}

	public void setDonatesector_name(String donatesector_name) {
		this.donatesector_name = donatesector_name;
	}

	@Transient
	private MultipartFile file;
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	private Date updateDate;
	
	public DonateRequestDTO() {
		
	}

	public int getDonatesector_id() {
		return donatesector_id;
	}

	public void setDonatesector_id(int donatesector_id) {
		this.donatesector_id = donatesector_id;
	}
	
}

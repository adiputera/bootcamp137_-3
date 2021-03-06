package com.xsis.batch137.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.DistrictDao;
import com.xsis.batch137.dao.ProvinceDao;
import com.xsis.batch137.dao.RegionDao;
import com.xsis.batch137.dao.SupplierDao;
import com.xsis.batch137.model.District;
import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;
import com.xsis.batch137.model.Supplier;
import com.xsis.batch137.model.User;

@Service
@Transactional
public class SupplierService {

	@Autowired
	SupplierDao supplierDao;
	
	@Autowired
	ProvinceDao provinceDao;
	
	@Autowired
	RegionDao regionDao;
	
	@Autowired
	DistrictDao districtDao;
	
	@Autowired
	HttpSession httpSession;
	
	
	//
	public void save(Supplier sup) {
		User userLogin = (User) httpSession.getAttribute("userLogin");
		sup.setCreatedBy(userLogin);
		sup.setCreatedOn(new Date());
		sup.setActive(true);
		supplierDao.save(sup);
	}
	
	public void update(Supplier sup) {
		User userLogin = (User) httpSession.getAttribute("userLogin");
		Supplier supplier = supplierDao.getOne(sup.getId());
		supplier.setModifiedOn(new Date());
		supplier.setAddress(sup.getAddress());
		supplier.setDistrict(sup.getDistrict());
		supplier.setEmail(sup.getEmail());
		supplier.setName(sup.getName());
		supplier.setPostalCode(sup.getPostalCode());
		supplier.setProvince(sup.getProvince());
		supplier.setRegion(sup.getRegion());
		supplier.setModifiedBy(userLogin);
		supplierDao.update(supplier);
	}
	
	public void delete(long id) {
		supplierDao.delete(id);
	}
	
	public List<Supplier> selectAll() {
		return supplierDao.selectAll();
	}
	
	public Supplier getOne(long id) {
		return supplierDao.getOne(id);
	}

	public List<Province> getAllProvince() {
		// TODO Auto-generated method stub
		return provinceDao.selectAll();
	}

	public List<Region> getRegionByProvince(long id) {
		// TODO Auto-generated method stub
		Province province = new Province();
		province.setId(id);
		return regionDao.getRegionByProvince(province);
	}

	public List<District> getDistrictByRegion(long id) {
		// TODO Auto-generated method stub
		Region region = new Region();
		region.setId(id);
		return districtDao.getDistrictByRegion(region);
	}

	public List<Supplier> searchSupplier(String search) {
		// TODO Auto-generated method stub
		return supplierDao.searchSupplier(search);
	}

	public int countName(String name) {
		// TODO Auto-generated method stub
		return supplierDao.countName(name);
	}

	public int countEmail(String email) {
		// TODO Auto-generated method stub
		return supplierDao.countEmail(email);
	}
	
}

package electronic.distributor.service;

import electronic.distributor.model.VendorModel;
import electronic.distributor.repository.AdminRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminservice")
public class AdminServiceImpl implements AdminService {
@Autowired
AdminRepository adminRepo;

public AdminServiceImpl() {
}

public boolean isAddVendor(VendorModel vendorModel) {
   return adminRepo.isAddVendor(vendorModel);
}

public List<VendorModel> getAllVendorList() {
   return adminRepo.getAllVendorList();
}

public void deleteVendorById(int vendorid) {
   adminRepo.deleteVendorById(vendorid);
}
}


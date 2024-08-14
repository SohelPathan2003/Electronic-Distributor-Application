package electronic.distributor.service;

import electronic.distributor.model.VendorModel;
import java.util.List;

public interface AdminService {
boolean isAddVendor(VendorModel vendormodel);

List<VendorModel> getAllVendorList();

void deleteVendorById(int id);
}
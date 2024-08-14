package electronic.distributor.repository;


import electronic.distributor.model.VendorModel;
import java.util.List;

public interface AdminRepository {
boolean isAddVendor(VendorModel vendormodel);

List<VendorModel> getAllVendorList();

void deleteVendorById(int vendorid );
}

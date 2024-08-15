package electronic.distributor.repository;

import electronic.distributor.model.VendorModel;
import java.util.List;

public interface AdminRepository {
	boolean isAddVendor(VendorModel vendormodel);

	List<VendorModel> getAllVendorList();

	public void deleteVendorById(int vendorid);

	public boolean isUpdateVendor(VendorModel vendormodel);

	public List<VendorModel> searchVendorByName(String str);
}

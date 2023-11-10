package com.bookstore.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.catalina.User;

import com.bookstore.model.UserRoles;
import com.bookstore.model.Users;
import com.bookstore.dto.UserGoogleDTO;


public class UsersDAO extends JpaDAO<Users> implements GenericDAO<Users> {

	public UsersDAO() {

	}

	@Override
	public Users create(Users user) {
		// TODO Auto-generated method stub
		return super.create(user);
	}

	@Override
	public Users update(Users user) {
		// TODO Auto-generated method stub
		return super.update(user);
	}

	@Override
	public Users get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Users.class, id);
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		super.delete(Users.class, id);
	}


	public Users checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
//		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
//		parameters.put("pass", encryptedPassword);
		parameters.put("password", password);
		
		List<Users> result = super.findWithNameQuery("Users.checkLogin", parameters);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}
	
	public Users findByEmail(String email) {
		List<Users> listUser = super.findWithNameQuery("Users.findByEmail", "email", email);
		if (listUser != null && listUser.size() == 1) {
			return listUser.get(0);
		}
		return null;
	}

	public Users findByTelephone(String telephone) {
		List<Users> listUser = super.findWithNameQuery("Users.findByTelephone", "telephone", telephone);
		if (listUser != null && listUser.size() == 1) {
			return listUser.get(0);
		}
		return null;
	}

	@Override
	public List<Users> listAll() {
		// TODO Auto-generated method stub
		return super.findWithNameQuery("Users.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return super.countWithNamedQuery("Users.countAll");
	}

	public boolean checkGoogleUserID(String googleId) throws Exception{
		return super.checkWithNameQuery("Users.findByGoogleId", "googleId", googleId);
    }

    public boolean addGoogleUser(UserGoogleDTO ug) throws Exception {
    	Users user = new Users();
    	UserRoles role = new UserRoles();
    	UsersDAO userDAO = new UsersDAO();
    	UserRolesDAO roleDAO = new UserRolesDAO();
    	user.setGoogleId(ug.getId());
    	user.setEmail(ug.getEmail());
    	user.setUsername(ug.getName());
    	user.setFirstName(ug.getGiven_name());
    	user.setLastName(ug.getFamily_name());
    	user.setPassword("userGoogle");
    	user.setBase64Image(ug.getPicture());
    	user.setTelephone(ug.getId());
    	user.setCreatedAt(Date.valueOf(LocalDate.now()));
    	user.setModifiedAt(Date.valueOf(LocalDate.now()));
     
        try {
        	user.setGoogleId(ug.getId());
        	user.setEmail(ug.getEmail());
        	user.setUsername(ug.getName());
        	user.setFirstName(ug.getGiven_name());
        	user.setLastName(ug.getFamily_name());
        	user.setPassword("userGoogle");
        	user.setBase64Image(ug.getPicture());
        	Random random = new Random();
        	user.setTelephone(String.format("%04d", random.nextInt(10000)));
        	user.setCreatedAt(Date.valueOf(LocalDate.now()));
        	user.setModifiedAt(Date.valueOf(LocalDate.now()));
        	userDAO.create(user);
        	role.setRole("customer");
        	role.setUsers(user);
        	roleDAO.create(role);
        		return true;
            }
         catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Users getUserByGoogleID(String googleId) {
		List<Users> listUser = super.findWithNameQuery("Users.findByGoogleId", "googleId", googleId);
		if (listUser != null && listUser.size() == 1) {
			return listUser.get(0);
		}
		return null;
	}
    

	
}

package com.cu.cum.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member implements UserDetails{

	@Id
	@Column(name="userid")
	private String userId;
	private String password;
	@Column(name = "username")
	private String userName;
	private String gender;
	private int age;
	private String email;
	private String phone;
	private String address;
	private String hobby;
//	@Temporal(TemporalType.DATE) //create했을경우
	@Column( name = "enrolldate")
	private Date enrollDate;
	
	
	
	
	
//	@Id
//	private String userId;
////	private enum role;
//	private String phone;
////	private String activated;
////	private double score;
//	private Date enrollDate;
//	private String intro;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		List<GrantedAuthority> auth = new ArrayList();
		auth.add(new SimpleGrantedAuthority("ROLE_USER"));
		return auth;
	}
//	@Override
//	public String getPassword() {
//		// TODO Auto-generated method stub
//		return true;
//	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.userId;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
}

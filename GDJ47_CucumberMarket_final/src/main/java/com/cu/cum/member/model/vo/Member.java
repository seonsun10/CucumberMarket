package com.cu.cum.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.cu.cum.product.model.vo.Files;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
public class Member implements UserDetails{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "userid")
	private String userId;
	
	private String password;
	private String name;
	private String phone;
	
//	@Enumerated(EnumType.STRING)
//	private OnlineStatus activated; //online offline
	
//	private double score;
	
	@Temporal(TemporalType.DATE)
	private Date enrollDate;
	
	private String intro;
	
	@Column(name = "role")
    @Enumerated(EnumType.STRING)
	private Role role;
	
	@OneToMany(mappedBy="member")
	private List<Files> files;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		List<GrantedAuthority> auth = new ArrayList();
		auth.add(new SimpleGrantedAuthority(this.role.name()));
//		if(this.role.equals("admin")) auth.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		return auth;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.userId;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}

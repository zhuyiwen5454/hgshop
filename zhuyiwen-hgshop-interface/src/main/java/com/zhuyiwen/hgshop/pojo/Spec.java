package com.zhuyiwen.hgshop.pojo;

import java.io.Serializable;
import java.util.List;

public class Spec  implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8599802219300538401L;
	private Integer id;//	规格id
	private String specName;	//规格名称
	
	private  List<SpecOption> optionList;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}

	
	
	@Override
	public String toString() {
		return "Spec [id=" + id + ", specName=" + specName + ", optionList=" + optionList + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((specName == null) ? 0 : specName.hashCode());
		return result;
	}
	
	public List<SpecOption> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<SpecOption> optionList) {
		this.optionList = optionList;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Spec other = (Spec) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (specName == null) {
			if (other.specName != null)
				return false;
		} else if (!specName.equals(other.specName))
			return false;
		return true;
	}
	
	


}

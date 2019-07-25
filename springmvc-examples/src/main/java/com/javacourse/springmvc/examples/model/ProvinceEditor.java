package com.javacourse.springmvc.examples.model;

import java.beans.PropertyEditorSupport;
import java.util.HashMap;
import java.util.Map;

public class ProvinceEditor extends PropertyEditorSupport {

	@Override
	public String getAsText() {
		if (this.getValue() == null) return null;
		return ((Province)this.getValue()).getCode();
	}

	@Override
	public void setAsText(String code) throws IllegalArgumentException {
		Map<String, Province> provinces = new HashMap<>();
		provinces.put("MI", new Province("MI", "Milano"));
		provinces.put("TO", new Province("TO", "Torino"));
		provinces.put("RM", new Province("RM", "Roma"));
		provinces.put("VR", new Province("VR", "Verona"));
		provinces.put("VE", new Province("VE", "Venezia"));
		this.setValue(provinces.get(code));
	}

}

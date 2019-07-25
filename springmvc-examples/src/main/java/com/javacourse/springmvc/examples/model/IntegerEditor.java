package com.javacourse.springmvc.examples.model;

import java.beans.PropertyEditorSupport;

public class IntegerEditor extends PropertyEditorSupport {

	@Override
	public String getAsText() {
		if (this.getValue() == null)
			return null;
		
		  
		return (Float.valueOf((Integer) this.getValue() / 8.0f)).toString();
	}

	@Override
	public void setAsText(String days) throws IllegalArgumentException {
		
		this.setValue((int) (Float.valueOf(days) * 8));
	}

}

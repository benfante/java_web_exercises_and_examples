package com.javacourse.springmvc.examples.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class Item implements Serializable {
	private static final long serialVersionUID = -1243660458763239457L;
	@NotBlank
	private String description;
	private BigDecimal cost;
	private int priority;

	public Item(String description, BigDecimal cost, int priority) {
		this.description = description;
		this.cost = cost;
		this.priority = priority;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

}

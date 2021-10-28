package com.pietro.scrutinio_Elettronico;

import java.time.LocalDateTime;

public class Scrutatore extends Utente {
	@SuppressWarnings("unused")
	private int id;
	
	public Scrutatore(String n, String c, int id) {
		super(n, c);
		this.id = id;
	}
	
	public boolean chooseVotationType() {
		return false;
	}
	
	public boolean chooseCondition() {
		return false;
	}
	
	public boolean chooseDate(LocalDateTime stop) {
		return false;
	}
	
	@Override
	public boolean equals(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

}

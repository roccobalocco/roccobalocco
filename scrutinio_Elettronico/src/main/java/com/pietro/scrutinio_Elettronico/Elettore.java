package com.pietro.scrutinio_Elettronico;

import java.time.LocalDate;

public class Elettore extends Utente {
	@SuppressWarnings("unused")
	private String CF, provincia, comune, indirizzo, num_carta_id;
	@SuppressWarnings("unused")
	private LocalDate data_nascita;
	
	public Elettore(String n, String c, String cf, String p, String cm, String in, String nid, int day, int month, int year) {
		super(n, c); 
		CF = cf; comune = cm; indirizzo = in; num_carta_id = nid; 
		if (day < 10) {
			data_nascita = LocalDate.parse(year+"-"+month+"-0"+day);
		}else {
			data_nascita = LocalDate.parse(year+"-"+month+"-"+day);
		}
	}
	
	public boolean canVote() {
		return false;
	}
	
	public boolean vote() { 
		return false; 
	}
	
	@Override
	public boolean equals(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

}

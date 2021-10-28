package com.pietro.scrutinio_Elettronico;

public abstract class Utente {
	protected String nome, cognome;
	
	public Utente(String n, String c) {
		nome = n; cognome = c;
	}
	
	public abstract boolean equals(Object o); 

}

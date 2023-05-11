import { Component } from '@angular/core';
import { TokenStorageService } from 'src/app/services/token-storage.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-ricette',
  templateUrl: './ricette.component.html',
  styleUrls: ['./ricette.component.css']
})
export class RicetteComponent {
  ricetta: any = {
    nome: '',
    tempo: '',
    difficolta: '',
    calorie: '',
    categoria: '',
    ingredienti: []
  };
  ricette: any;
  nomeRicetta: any;
  nomeIngrediente: any;
  nomeIngredienteEscluso: any;
  ingredientiDisponibili: any;
  ingredienteSelezionato: any = { nome: '' };
  ingredienteSelezionatoNew = { nome: '' } as any;
  ingredientiSelezionati: any[] = [];
  ingredienteEsistente: any;
  nuovoIngrediente: any;
  isLoggedIn = false;

  constructor(private rest: UserService, private token: TokenStorageService) {}

  ngOnInit() {
    this.isLoggedIn = !!this.token.getToken();
    this.getRicette();
    this.getIngredienti();
  }

  getRicette() {
    const onSuccess = (response: any) => this.ricette = response;
    return this.rest.getRicette().subscribe(onSuccess);
  }

  getIngredienti() {
    const onSuccess = (response: any) => this.ingredientiDisponibili = response;
    return this.rest.getIngredienti().subscribe(onSuccess);
  }

  aggiungiIngrediente() {
    this.ingredienteEsistente = this.ingredientiDisponibili.find((ingrediente: { nome: string; }) => ingrediente.nome.toLowerCase() === this.ingredienteSelezionato.toLowerCase());
    if (!this.ingredienteEsistente) {
      const nuovoIngredienteDaAggiungere = { nome: this.ingredienteSelezionato.nome };
      this.ingredientiDisponibili.push(nuovoIngredienteDaAggiungere);
      this.ingredienteSelezionato = nuovoIngredienteDaAggiungere;
    } else {
      this.ingredienteSelezionato = this.ingredienteEsistente;
    }
    if (!this.ingredientiSelezionati.some(ingrediente => ingrediente.nome.toLowerCase() === this.ingredienteSelezionato.nome.toLowerCase())) {
      const ingredienteDaAggiungere = { nome: this.ingredienteSelezionato.nome };
      this.ingredientiSelezionati.push(ingredienteDaAggiungere);
      this.ricetta.ingredienti.push(ingredienteDaAggiungere);
    }
    this.ingredienteSelezionato = { nome: '' };
  }

  aggiungiNuovoIngrediente() {
    this.ingredienteEsistente = this.ingredientiDisponibili.find((ingrediente: { nome: string; }) => ingrediente.nome.toLowerCase() === this.ingredienteSelezionatoNew.nome.toLowerCase());
    if (!this.ingredienteEsistente) {
      const nuovoIngredienteDaAggiungere = { nome: this.ingredienteSelezionatoNew.nome };
      this.ingredientiDisponibili.push(nuovoIngredienteDaAggiungere);
      this.ingredienteSelezionatoNew = nuovoIngredienteDaAggiungere;
    } else {
      this.ingredienteSelezionatoNew = this.ingredienteEsistente;
    }
    if (!this.ingredientiSelezionati.includes(this.ingredienteSelezionatoNew)) {
      this.ingredientiSelezionati.push(this.ingredienteSelezionatoNew);
      this.ricetta.ingredienti.push(this.ingredienteSelezionatoNew);
    }
    this.ingredienteSelezionatoNew = { nome: '' };
  }


  invia() {
    const onSuccess = () => {
      alert('La ricetta è stata inserita con successo!');
      this.ricetta = {};
    };
    console.log(this.ricetta);
    return this.rest.inviaRicetta(this.ricetta).subscribe(onSuccess);
  }
}
function orderBy(ricette: any, arg1: string) {
  throw new Error('Function not implemented.');
}


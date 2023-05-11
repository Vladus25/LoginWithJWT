import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filtroRicette'
})
export class FiltroRicettePipe implements PipeTransform {

  transform(ricette: any[], nomeRicetta: string, nomeIngrediente: string, nomeIngredienteEscluso?: string, proprietaOrdinamento?: string): any[] {

    let ricetteFiltrate = ricette || [];

    if (nomeRicetta) {
      ricetteFiltrate = ricetteFiltrate.filter(r => r.nome.toLowerCase().includes(nomeRicetta.toLowerCase()));
    }
    if (nomeIngrediente) {
      ricetteFiltrate = ricetteFiltrate.filter(r => r.ingredienti.some((i: { nome: string; }) => i.nome.toLowerCase().includes(nomeIngrediente.toLowerCase())));
    }
    if (nomeIngredienteEscluso) {
      ricetteFiltrate = ricetteFiltrate.filter(r => !r.ingredienti.some((i: { nome: string; }) => i.nome.toLowerCase().includes(nomeIngredienteEscluso.toLowerCase())));
    }
    if (proprietaOrdinamento) {
      ricetteFiltrate = ricetteFiltrate.sort((a, b) => {
        const valoreA = a[proprietaOrdinamento].toLowerCase();
        const valoreB = b[proprietaOrdinamento].toLowerCase();
        if (valoreA < valoreB) {
          return -1;
        }
        if (valoreA > valoreB) {
          return 1;
        }
        return 0;
      });
    }
    return ricetteFiltrate;
  }
}

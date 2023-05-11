import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { PersoneComponent } from './components/persone/persone.component';
import { ProfileComponent } from './components/profile/profile.component';
import { HomeComponent } from './components/home/home.component';
import { RicetteComponent } from './components/ricette/ricette.component';

const routes: Routes = [
  {path:'Home', component: HomeComponent },
  {path:'Login', component:LoginComponent},
  {path:'Register', component:RegisterComponent},
  {path:'Persone', component:PersoneComponent},
  {path:'Profile', component:ProfileComponent},
  {path:'Ricette', component:RicetteComponent},
  {path: '', redirectTo: 'Home', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

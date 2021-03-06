import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Usuario } from '../../interfaces/usuario.interface';
import { environment } from 'src/environments/environment';
import { RequestResponse } from '../../interfaces/requestResponse.interface';

@Injectable({
  providedIn: 'root'
})
export class SignupService {

  constructor(private http: HttpClient) { }

  criarUsuario(usuario: Usuario): Promise<RequestResponse> {
    return this.http.post<RequestResponse>(`${environment.apiUrl}/usuario`, usuario)
      .toPromise().then(response => Promise.resolve(response))
      .catch(error => Promise.reject(error));
  }
}

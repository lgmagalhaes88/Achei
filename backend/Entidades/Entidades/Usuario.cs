﻿using Entidades.Interfaces;
using System;
using System.Collections.Generic;

namespace Entidades.Entidades
{
    public partial class Usuario : IEntity
    {
        public long Id { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public string FotoPerfil { get; set; }
        public string Estado { get; set; }
        public DateTime? DataNascimento { get; set; }
        public string Telefone { get; set; }
        public string Sexo { get; set; }
        public string Cidade { get; set; }
        public virtual ICollection<ItemAchado> ItensAchados { get; set; }
        public virtual ICollection<ItemPerdido> ItensPerdidos { get; set; }
    }
}

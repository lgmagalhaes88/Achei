﻿using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Persistencia.Contexts.Application;

namespace Migrations
{
    [Migration("2019031001")]
    [DbContext(typeof(ApplicationDbContext))]
    public class Conversor_2019031001 : Migration
    {
        protected override void Up(MigrationBuilder migration)
        {
            migration.Sql("CREATE TABLE usuario (" +
                "id int not null auto_increment," +
                "nome varchar(255) not null, " +
                "email varchar(255) not null, " +
                "senha varchar(255) not null, " +
                "foto_perfil TEXT(65535) null, " +
                "estado varchar(100) null, " +
                "data_nascimento date null, " +
                "telefone varchar(30) null, " +
                "sexo varchar(10) null, " +
                "cidade varchar(100) null, " +
                "PRIMARY KEY(id) " +
                ")");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
        }
    }
}

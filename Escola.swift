import Foundation

/*
 Cadastrar novos colaboradores.
 Remover colaboradores através de sua matrícula.
 Listar gastos mensais com todos os colaboradores.
 Listar gastos mensais por cargo (quanto é gasto com monitor, quanto é gasto com professor, etc.)
 Listar quantas pessoas existem por cargo (quantos monitores, quantos professores, etc.)
 Listar os nomes de todos os colaboradores em ordem alfabética.
 */

enum Cargo {
    case monitor
    case professor
    case coordenador
    case diretor
    case assistente
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Double
    let cargo: Cargo
    
    func apresenta() -> String {
        "Meu nome é \(nome), sou \(cargo) e minha matrícula é \(matricula)"
    }
}



class Escola {
    
    //Cadastra Colaboradores
    
    
    //Remove Colaboradores por Matricula
    
    
    //Lista gastos mensais com todos os colaboradores
    
    
    //Lista gastos mensais por cargo
    
    
    //Lista quantas pessoas existem por cargo
    
    
    //Lista os nomes de todos os colaboradores em ordem alfabética
    
}


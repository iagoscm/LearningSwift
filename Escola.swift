import Foundation

/*
 Cadastrar novos colaboradores.
 Remover colaboradores através de sua matrícula.
 Listar gastos mensais com todos os colaboradores.
 Listar gastos mensais por cargo (quanto é gasto com monitor, quanto é gasto com professor, etc.)
 Listar quantas pessoas existem por cargo (quantos monitores, quantos professores, etc.)
 Listar os nomes de todos os colaboradores em ordem alfabética.
 
 O SALÁRIO pode conter qualquer valor, mas o maior salário deve ser sempre o do DIRETOR.
 A ESCOLA não pode ter mais do que um DIRETOR.
 A ESCOLA não pode ter mais COORDENADORES do que PROFESSORES.
 */

enum Cargo {
    case monitor
    case professor
    case coordenador
    case diretor
    case assistente
    
    func nomeCargo() -> String {
        switch self {
        case .coordenador:
            return "Coordenador"
        case .diretor:
            return "Diretor"
        case .monitor:
            return "Monitor"
        case .assistente:
            return "Assistente"
        case .professor:
            return "Professor"
        }
    }
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Double
    let cargo: Cargo
}



class Escola {
    var colaboradores: [Colaborador] = []
    var diretorExistente: Bool = false
    var coordenadoresCount = 0
    
    init(colaboradores: [Colaborador]? = nil){
        self.colaboradores = colaboradores ?? []
        contabilizarCargos()
    }
    
    //Contabiliza os cargos para que possa ter atualizacao de quantos diretores e coordenadores
    private func contabilizarCargos(){
        diretorExistente = colaboradores.contains(where: { $0.cargo == .diretor})
        coordenadoresCount = colaboradores.filter { $0.cargo == .coordenador }.count
    }
    
    //Estabelece a quantidade maxima de coordenadores
    private func quantidadeMaximaCoordenadores() -> Int {
        let professoresCount = colaboradores.filter { $0.cargo == .professor }.count
        return professoresCount
    }
    
    //Retorna o salario do diretor da escola, caso exista
    private func salarioDiretor() -> Double {
        if let diretor = colaboradores.first(where: { $0.cargo == .diretor }) {
            return diretor.salario
        }
        return 999999679 //Numero elevado para fazer verificacao. A falta que um define faz
    }
    
    //Cadastra colaboradores
    func cadastraColaborador(_ colaborador: Colaborador){
        if(colaborador.cargo == .diretor && diretorExistente){
            print("Já existe um diretor na escola.")
            return
        }
        
        if(colaborador.cargo == .coordenador && coordenadoresCount >= quantidadeMaximaCoordenadores()){
            print("Numero máximo de coordenadores já foi atingido.")
            return
        }
        
        let salarioDiretor = salarioDiretor()
        
        if(colaborador.salario >= salarioDiretor && salarioDiretor != 999999679){
            print("Ta ganhando muito, maior salario tem que ser do diretor.")
            return
        }
        
       
        
        colaboradores.append(colaborador)
        
        if(colaborador.cargo == .diretor){
            diretorExistente = true
        }
        
        contabilizarCargos()
    }
    
    //Remove colaboradores por matricula
    func removeColaborador(deMatricula matricula: Int){
        colaboradores.removeAll{ $0.matricula == matricula }
        contabilizarCargos()
    }
    
    //Lista gastos mensais com todos os colaboradores
    func listaGastosMensais() -> String {
        var gasto = 0.0
        
        for colaborador in colaboradores {
            gasto += colaborador.salario
        }
        
        return "Gasto total mensal é igual a \(gasto)"
    }
    
    //Lista gastos mensais por cargo
    func listaGasto(doCargo cargo: Cargo) -> String {
        var gasto = 0.0
        
        for colaborador in colaboradores where colaborador.cargo == cargo {
            gasto += colaborador.salario
        }
        
        return "Os gastos do cargo \(cargo.nomeCargo()) são, mensalmente, de R$\(gasto)"
    }
    
    //Lista quantas pessoas existem por cargo
    func listaPessoas(porCargo cargo: Cargo) -> String {
        var qtdPorCargo = 0
        
        qtdPorCargo = colaboradores.filter{ $0.cargo == cargo }.count
    
        return "Existe(m) \(qtdPorCargo) colaborador(es) do cargo \(cargo.nomeCargo())"
    }
    
    //Lista os nomes de todos os colaboradores em ordem alfabética
    func listaColaboradoresOrdemAlfabetica() -> [String]{
        var nomes: [String] = []
        
        nomes = colaboradores.map{ $0.nome }.sorted()
        return nomes
    }
    
}


let algunsColaboradores: [Colaborador] =
    [
        Colaborador(nome: "Ana", matricula: 1001, salario: 3000.00, cargo: .professor),
        Colaborador(nome: "João", matricula: 1002, salario: 2500.00, cargo: .assistente),
        Colaborador(nome: "Maria", matricula: 1003, salario: 4000.00, cargo: .coordenador),
        Colaborador(nome: "Pedro", matricula: 1004, salario: 5000.00, cargo: .diretor),
        Colaborador(nome: "Carla", matricula: 1005, salario: 2000.00, cargo: .monitor),
        Colaborador(nome: "Luiz", matricula: 1006, salario: 3500.00, cargo: .professor),
        Colaborador(nome: "Mariana", matricula: 1007, salario: 2800.00, cargo: .assistente),
        Colaborador(nome: "Roberto", matricula: 1008, salario: 4200.00, cargo: .coordenador),
        Colaborador(nome: "Amanda", matricula: 1009, salario: 5500.00, cargo: .diretor),
        Colaborador(nome: "Ricardo", matricula: 1010, salario: 2300.00, cargo: .monitor),
        Colaborador(nome: "Maxwell", matricula: 1015, salario: 4200.00, cargo: .coordenador),
        Colaborador(nome: "Jonathan", matricula: 1016, salario: 6000.00, cargo: .professor)
        
    ]

let escola = Escola()

for colaborador in algunsColaboradores {
    escola.cadastraColaborador(colaborador)
}

print(escola.listaColaboradoresOrdemAlfabetica())

let colaborador1 = Colaborador(nome: "Manuel", matricula: 1020, salario: 7000.00, cargo: .diretor)
let colaborador2 = Colaborador(nome: "Jonathan", matricula: 1016, salario: 6000.00, cargo: .professor)

//escola.cadastraColaborador(colaborador1)

escola.removeColaborador(deMatricula: 1004)

escola.cadastraColaborador(colaborador1)

print(escola.listaColaboradoresOrdemAlfabetica())

escola.cadastraColaborador(colaborador2)

escola.removeColaborador(deMatricula: 1020)

print(escola.listaColaboradoresOrdemAlfabetica())

print(escola.listaGastosMensais())

print(escola.listaGasto(doCargo: .professor))

print(escola.listaPessoas(porCargo: .professor))


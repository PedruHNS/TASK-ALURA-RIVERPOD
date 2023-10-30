import 'dart:convert';

class Task {
  final String id;
  final int dificuldade;
  final String titulo;
  final String imagem;
  final int nivel;
  Task({
    required this.id,
    this.nivel = 0,
    required this.dificuldade,
    required this.titulo,
    required this.imagem,
  });

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.dificuldade == dificuldade &&
        other.titulo == titulo &&
        other.imagem == imagem;
  }

  @override
  int get hashCode => dificuldade.hashCode ^ titulo.hashCode ^ imagem.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dificuldade': dificuldade,
      'titulo': titulo,
      'imagem': imagem,
      'nivel': nivel,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? '',
      dificuldade: map['dificuldade'] ?? 0,
      titulo: map['titulo'] ?? '',
      imagem: map['imagem'] ?? '',
      nivel: map['nivel'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  Task copyWith({
    String? id,
    int? dificuldade,
    String? titulo,
    String? imagem,
    int? nivel,
  }) {
    return Task(
      id: id ?? this.id,
      dificuldade: dificuldade ?? this.dificuldade,
      titulo: titulo ?? this.titulo,
      imagem: imagem ?? this.imagem,
      nivel: nivel ?? this.nivel,
    );
  }
}

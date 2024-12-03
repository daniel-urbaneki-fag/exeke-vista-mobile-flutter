import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/api_routes.dart';

import 'package:exekevistaapp/components/CustomNavBar.dart';

class VisualizarSolicitacoes extends StatefulWidget {
  const VisualizarSolicitacoes({super.key});

  @override
  VisualizarSolicitacoesState createState() => VisualizarSolicitacoesState();
}

class VisualizarSolicitacoesState extends State<VisualizarSolicitacoes> {
  List<dynamic> solicitacoes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSolicitacoes();
  }

  Future<void> fetchSolicitacoes() async {
    String apiUrl = ApiRoutes.getSolicitacoes;

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          solicitacoes = data;
          isLoading = false;
        });
      } else {
        throw Exception('Erro ao carregar dados');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomNavBar(currentPage: "Visualizar Solicitações"),
                    const Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ID",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Cliente",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Status",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ...solicitacoes.map((solicitacao) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  solicitacao['id'].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  solicitacao['nome_cliente'] ?? 'Sem Nome',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  solicitacao['data_fim'] ?? 'Andamento',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard('Informações Pessoais', [
              _buildInfoItem('Username', user.username),
              _buildInfoItem('Email', user.email),
              _buildInfoItem('Telefone', user.phone),
              _buildInfoItem('Website', user.website),
            ]),
            const SizedBox(height: 16),
            _buildInfoCard('Endereço', [
              _buildInfoItem('Rua', user.address.street),
              _buildInfoItem('Complemento', user.address.suite),
              _buildInfoItem('Cidade', user.address.city),
              _buildInfoItem('CEP', user.address.zipcode),
            ]),
            const SizedBox(height: 16),
            _buildInfoCard('Empresa', [
              _buildInfoItem('Nome', user.company.name),
              _buildInfoItem('Slogan', user.company.catchPhrase),
              _buildInfoItem('Negócio', user.company.bs),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
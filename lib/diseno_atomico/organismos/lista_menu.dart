import 'package:flutter/material.dart';

class ItemMenu {
  final String titulo;
  final VoidCallback onTap;
  ItemMenu(this.titulo, this.onTap);
}

class ListaMenu extends StatelessWidget {
  const ListaMenu({super.key, required this.items});

  final List<ItemMenu> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          child: ListTile(
            title: Text(item.titulo),
            trailing: const Icon(Icons.chevron_right),
            onTap: item.onTap,
          ),
        );
      },
    );
  }
}

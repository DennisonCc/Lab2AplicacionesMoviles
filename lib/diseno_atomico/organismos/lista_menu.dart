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
    final colores = Theme.of(context).colorScheme;
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        final colorTarjeta = index.isEven
            ? colores.primaryContainer.withValues(alpha: 0.55)
            : colores.secondaryContainer.withValues(alpha: 0.55);
        return Card(
          color: colorTarjeta,
          child: ListTile(
            title: Text(
              item.titulo,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colores.onSurface,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: colores.primary),
            onTap: item.onTap,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_pro/models/item_model.dart';

class ItemCard extends StatefulWidget {
  final ItemModel item;
  final Function? onChanged;

const ItemCard({ super.key, required this.item, this.onChanged });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          widget.item.itemTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: widget.item.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.itemDescription,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                decoration: widget.item.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Due: ${widget.item.itemDate}",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
        trailing: Checkbox(
          value: widget.item.isDone,
          activeColor: Colors.blue,
          onChanged: (value) => widget.onChanged!(value),
        ),
      ),
    );
  }
}
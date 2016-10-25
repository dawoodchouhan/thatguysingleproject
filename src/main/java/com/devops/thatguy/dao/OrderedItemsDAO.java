package com.devops.thatguy.dao;

import java.util.List;

import com.devops.thatguy.model.OrderedItems;

public interface OrderedItemsDAO {
void saveOrUpdate(OrderedItems orderedItems );
void delete(String orderedItemId);
	
List<OrderedItems> listOrderedItems();
}

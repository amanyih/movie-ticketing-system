package com.movietickets.Filters;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebFilter;

@WebFilter("/searchfiliter")
public class SearchFilter {

    public static List<String> filterList(List<String> items, String query) {
        List<String> filteredList = new ArrayList<>();

        for (String item : items) {
            // Case-insensitive search
            if (item.toLowerCase().contains(query.toLowerCase())) {
                filteredList.add(item);
            }
        }

        return filteredList;
    }

    public static void main(String[] args) {
        // Example usage
        List<String> itemList = List.of("Apple", "Banana", "Orange", "Mango", "Pineapple");
        String searchQuery = "an";

        List<String> result = filterList(itemList, searchQuery);

        if (!result.isEmpty()) {
            System.out.println("Search results for '" + searchQuery + "':");
            for (String item : result) {
                System.out.println(item);
            }
        } else {
            System.out.println("No results found for '" + searchQuery + "'.");
        }
    }
}


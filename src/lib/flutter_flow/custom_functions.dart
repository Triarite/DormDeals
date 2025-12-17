import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? convertStringToImagePath(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return null; // Return null if the URL is empty
  }
  return imageUrl; // Return the image URL as the Image Path type
}

double? getAverageFromIntList(List<int>? listOfRatings) {
  // Take a list of integers and return a double of the average of those integers
  if (listOfRatings == null || listOfRatings.isEmpty) {
    return 0; // Return 0 if the list is empty or null
  }

  double sum = 0;
  for (int rating in listOfRatings) {
    sum += rating; // add to sum
  }

  return sum / listOfRatings.length; // Return the average
}

List<ProductsRecord>? ilterProductsByCategory(
  List<ProductsRecord>? productsList,
  String? selectedCategory,
) {
  if (productsList == null) {
    return null;
  }

  // If no category selected, show everything
  if (selectedCategory == null || selectedCategory.isEmpty) {
    return productsList;
  }

  return productsList.where((p) => p.category == selectedCategory).toList();
}

List<String> generateListofNames(
  String authUsername,
  String otherUsername,
) {
  return [authUsername, otherUsername];
}

DocumentReference? getProductReferenceFromProduct(ProductsRecord? document) {
  // Get product reference of given product
  if (document != null && document.hasOwnerRef()) {
    return document.ownerRef;
  }
  return null;
}

double? getShoppingCartSubtotal() {
// Get the sum of all "price" values for each document reference in Authenticated User's "shopping_cart" list of document references
  if (currentUserDocument == null ||
      currentUserDocument!.shoppingCart.isEmpty) {
    return 0.0;
  }

  double subtotal = 0.0;

  for (DocumentReference productRef in currentUserDocument!.shoppingCart) {
    // Fetch the product document from Firestore
    productRef.get().then((productDoc) {
      if (productDoc.exists) {
        // Cast data to Map so [] works
        final data = productDoc.data() as Map<String, dynamic>?;

        // Safe price read
        subtotal += (data?['price'] ?? 0.0) as double;
      }
    });
  }

  return subtotal;
}

List<ProductsRecord> filterProductsByCategory(
  List<ProductsRecord> products,
  String? selectedCategory,
  String? searchText,
) {
  // Start with everything.
  List<ProductsRecord> filtered = products;

  // 1) Filter by category if it's set and not "All".
  if (selectedCategory != null &&
      selectedCategory.isNotEmpty &&
      selectedCategory != 'All') {
    filtered = filtered.where((p) => p.category == selectedCategory).toList();
  }

  // 2) Filter by search text (title contains query).
  if (searchText != null && searchText.trim().isNotEmpty) {
    final q = searchText.trim().toLowerCase();
    filtered = filtered
        .where((p) => (p.title ?? '').toLowerCase().contains(q))
        .toList();
  }

  return filtered;
}

DocumentReference getOtherUserRef(
  DocumentReference userRef1,
  DocumentReference userRef2,
  DocumentReference currentUserRef,
) {
  return currentUserRef.path == userRef1.path ? userRef2 : userRef1;
}

int? by100(double? price) {
  return ((price ?? 0) * 100).round();
}

DocumentReference getotheruserinchat(
  DocumentReference authUser,
  DocumentReference sellerUID,
) {
  return authUser.id == sellerUID.id ? sellerUID : authUser;
}

double incrementCart(
  double price,
  double totalValue,
) {
  return totalValue + price;
}

double decrementCart(
  double price,
  double totalValue,
) {
  return totalValue - price;
}

package com.bookstore.common.utils;

import java.text.Normalizer;
import java.text.Normalizer.Form;

public class SlugGenerator {

	public static String generateSlug(String title) {
        // Remove special characters, convert to lowercase, and replace spaces with hyphens
        String slug = title.replaceAll("[^\\p{Alnum}\\s-]", "")
                .toLowerCase()
                .replaceAll("\\s+", "-");

        // Remove consecutive hyphens
        slug = slug.replaceAll("-{2,}", "-");

        // Remove leading and trailing hyphens
        slug = slug.replaceAll("^-|-$", "");

        // Normalize unicode characters to their closest ASCII representation
        slug = Normalizer.normalize(slug, Form.NFD)
                .replaceAll("\\p{InCombiningDiacriticalMarks}+", "")
                .replaceAll("[^\\p{ASCII}]", "");

        return slug;
    }
}
<?php
/*
 * @file
 *
 * This document sets the formatter rules in VS Code (or any phpcs-enabled
 * formatter). Just install Phpcs extension: Ctrl(⌘)+P = `ext install phpcs`.
 * This is inspired by the work of drupol/drupal-conventions
 *
 * Known Bug: the formatter enters new line in `} else {` statement.
 *            the task `Drupal Clean` however fixes this. @see ./tasks.json
 */
return PhpCsFixer\Config::create()
  ->setRules([
    // Drupal generic
    '@PSR2' => false,
    'blank_line_before_statement' => ['statements' => ['break', 'case', 'continue', 'declare', 'default', 'die', 'do', 'exit', 'for', 'foreach', 'goto', 'if', 'include', 'include_once', 'require', 'require_once', 'return', 'switch', 'throw', 'try', 'while', 'yield', ]],
    'braces' => [
      'allow_single_line_closure' => true,
      'position_after_functions_and_oop_constructs' => 'same',
      'position_after_control_structures' => 'same',
      'position_after_anonymous_constructs' => 'same',
      // 'position_before_control_structures' =>
    ],
    'class_attributes_separation' => false,
    'comment_to_phpdoc' => false,
    'compact_nullable_typehint' => true,
    'declare_equal_normalize' => ['space' => 'single'],
    // 'Drupal/try_catch_block' => true,
    // 'Drupal/uppercase_constants' => true,
    'encoding' => true,
    'full_opening_tag' => true,
    'function_declaration' => ['closure_function_spacing' => 'one'],
    'indentation_type' => false,
    'line_ending' => true,
    'lowercase_constants' => false,
    'lowercase_keywords' => true,
    'method_separation' => false,
    'no_alternative_syntax' => false,
    'no_blank_lines_after_class_opening'=> false,
    'no_blank_lines_after_phpdoc' => false,
    'no_extra_blank_lines'=> ['tokens' => ['break', 'case', 'continue', 'default', 'extra', 'parenthesis_brace_block', 'return', 'square_brace_block', 'switch', 'throw', 'use', 'use_trait']],
    'no_mixed_echo_print' => ['use' => 'print'],
    'no_spaces_after_function_name' => true,
    'no_spaces_inside_parenthesis' => true,
    'phpdoc_add_missing_param_annotation' => false,
    'single_line_comment_style' => true,
    'single_quote' => ['strings_containing_single_quote_chars' => false],
    'switch_case_semicolon_to_colon' => true,
    'switch_case_space' => true,
    'visibility_required' => true,
    'array_indentation' => true,
    // Drupal 8 specifics
    'declare_strict_types' => false,
    'array_syntax' => ['syntax' => 'short'],

    // 'blank_line_after_opening_tag' => true,
    // 'include' => true,
    // 'lowercase_cast' => false,
    // 'no_empty_comment' => true,
    // 'no_empty_phpdoc' => true,
    // 'no_whitespace_in_blank_line' => true,
    // 'single_blank_line_before_namespace' => true,
    // 'ternary_operator_spaces' => true,
    // 'trailing_comma_in_multiline_array' => true,
    // 'trim_array_spaces' => true,
    // 'unary_operator_spaces' => true,
    // 'whitespace_after_comma_in_array' => true,
  ])
  ->setIndent('  ')
  ->setLineEnding("\n");

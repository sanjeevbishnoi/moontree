import 'package:flutter/material.dart';
import 'package:moontree_layer_flutter/presentation/components/fonts.dart';
import 'package:moontree_layer_flutter/presentation/components/colors.dart'
    as colors;

const TextStyle h1 = TextStyle(
    fontSize: 24.0,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.normal,
    letterSpacing: 0.18,
    color: colors.black);

const TextStyle h2 = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.semiBold,
    letterSpacing: 0.18,
    color: colors.black);

const TextStyle subtitle1 = TextStyle(
    fontSize: 16.0,
    height: 1.5,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.semiBold,
    letterSpacing: 0.15,
    color: colors.black60);

const TextStyle subtitle2 = TextStyle(
    fontSize: 14.0,
    height: 1.714,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.normal,
    letterSpacing: 0.1,
    color: colors.black);

const TextStyle body1 = TextStyle(
    fontSize: 16.0,
    height: 1.5,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.semiBold,
    letterSpacing: 0.5,
    color: colors.black);

const TextStyle body2 = TextStyle(
    fontSize: 14.0,
    height: 1.714,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.semiBold,
    letterSpacing: 0.25,
    color: colors.black);

const TextStyle button = TextStyle(
    fontSize: 14.0,
    height: 1.143,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.normal,
    letterSpacing: 1.25,
    color: colors.black);

const TextStyle caption = TextStyle(
    fontSize: 12.0,
    height: 1.333,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.semiBold,
    letterSpacing: 0.4,
    color: colors.black);

const TextStyle overline = TextStyle(
    fontSize: 10.0,
    height: 1.6,
    fontFamily: 'Nunito',
    fontWeight: FontWeights.normal,
    letterSpacing: 1.5,
    color: colors.black);

/// derivations

TextStyle softButton = button.copyWith(
  fontWeight: FontWeights.semiBold,
  color: colors.primaries[6],
);
TextStyle invertButton = button.copyWith(
  fontWeight: FontWeights.semiBold,
  color: colors.white,
);
TextStyle disabledButton = button.copyWith(
  fontWeight: FontWeights.semiBold,
  color: colors.black38,
);
TextStyle enabledButton = button.copyWith(
  fontWeight: FontWeights.semiBold,
  color: colors.offBlack,
);
TextStyle link = body1.copyWith(
  fontWeight: FontWeights.semiBold,
  color: colors.primary,
);
TextStyle checkoutFees = caption.copyWith(
  height: 1,
  color: colors.black,
);
TextStyle checkoutSubAsset = body2.copyWith(
  fontWeight: FontWeights.bold,
  color: colors.black60,
);
TextStyle checkoutItem = body2.copyWith(
  fontWeight: FontWeights.semiBold,
  color: colors.black60,
);
TextStyle checkoutFee = body2.copyWith(
  fontWeight: FontWeights.semiBold,
  color: colors.black60,
);

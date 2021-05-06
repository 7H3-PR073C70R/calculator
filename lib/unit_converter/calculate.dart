class Calculate {
  final double number1;
  final String unit;
  final String unit2;
  final Function(String answer) func;
  Calculate({this.unit, this.unit2, this.number1, this.func});

  calculateArea() {
    String num = '';
    if (unit == 'Acres (ac)' && unit2 == 'Ares (a)') {
      num = (number1 * 40.468564224).toString();
    } else if (unit == 'Acres (ac)' && unit2 == 'Hectares (ha)') {
      num = (number1 * 0.404656422).toString();
    } else if (unit == 'Acres (ac)' && unit2 == 'Square centimeters (cm²)') {
      num = (number1 * 40468564.224).toString();
    } else if (unit == 'Acres (ac)' && unit2 == 'Square feet (ft²)') {
      num = (number1 * 43560).toString();
    } else if (unit == 'Acres (ac)' && unit2 == 'Square inches (in²)') {
      num = (number1 * 6272640).toString();
    } else if (unit == 'Acres (ac)' && unit2 == 'Square meters (m²)') {
      num = (number1 * 4046.8564224).toString();
    } else if (unit == 'Ares (a)' && unit2 == 'Acres (ac)') {
      num = (number1 * 0.0247105381).toString();
    } else if (unit == 'Ares (a)' && unit2 == 'Hectares (ha)') {
      num = (number1 * 0.01).toString();
    } else if (unit == 'Ares (a)' && unit2 == 'Square centimeters (cm²)') {
      num = (number1 * 1000000).toString();
    } else if (unit == 'Ares (a)' && unit2 == 'Square feet (ft²)') {
      num = (number1 * 1076.391041671).toString();
    } else if (unit == 'Acres (ac)' && unit2 == 'Square inches (in²)') {
      num = (number1 * 155000.31000062).toString();
    } else if (unit == 'Acres (ac)' && unit2 == 'Square meters (m²)') {
      num = (number1 * 100).toString();
    } else if (unit == 'Hectares (ha)' && unit2 == 'Acres (ac)') {
      num = (number1 * 2.4710538147).toString();
    } else if (unit == 'Hectares (ha)' && unit2 == 'Ares (a)') {
      num = (number1 * 100).toString();
    } else if (unit == 'Hectares (ha)' && unit2 == 'Square centimeters (cm²)') {
      num = (number1 * 100000000).toString();
    } else if (unit == 'Hectares (ha)' && unit2 == 'Square feet (ft²)') {
      num = (number1 * 107639.1041671).toString();
    } else if (unit == 'Hectares (ha)' && unit2 == 'Square inches (in²)') {
      num = (number1 * 15500031.000062).toString();
    } else if (unit == 'Hectares (ha)' && unit2 == 'Square meters (m²)') {
      num = (number1 * 10000).toString();
    } else if (unit == 'Square centimeters (cm²)' && unit2 == 'Acres (ac)') {
      num = (number1 * 2.47105381E-8).toString();
    } else if (unit == 'Square centimeters (cm²)' && unit2 == 'Ares (a)') {
      num = (number1 * 0.000001).toString();
    } else if (unit == 'Square centimeters (cm²)' && unit2 == 'Hectares (ha)') {
      num = (number1 * 1.00000000E-8).toString();
    } else if (unit == 'Square centimeters (cm²)' &&
        unit2 == 'Square feet (ft²)') {
      num = (number1 * 0.001076391).toString();
    } else if (unit == 'Square centimeters (cm²)' &&
        unit2 == 'Square inches (in²)') {
      num = (number1 * 0.15500031).toString();
    } else if (unit == 'Square centimeters (cm²)' &&
        unit2 == 'Square meters (m²)') {
      num = (number1 * 0.0001).toString();
    } else if (unit == 'Square feet (ft²)' && unit2 == 'Acres (ac)') {
      num = (number1 * 0.0000229568).toString();
    } else if (unit == 'Square feet (ft²)' && unit2 == 'Ares (a)') {
      num = (number1 * 0.0009290304).toString();
    } else if (unit == 'Square feet (ft²)' &&
        unit2 == 'Square centimeters (cm²)') {
      num = (number1 * 929.0304).toString();
    } else if (unit == 'Square feet (ft²)' && unit2 == 'Hectares (ha)') {
      num = (number1 * 0.0000092903).toString();
    } else if (unit == 'Square feet (ft²)' && unit2 == 'Square inches (in²)') {
      num = (number1 * 144).toString();
    } else if (unit == 'Square feet (ft²)' && unit2 == 'Square meters (m²)') {
      num = (number1 * 0.09290304).toString();
    } else if (unit == 'Square inches (in²)' && unit2 == 'Acres (ac)') {
      num = (number1 * 1.59422508E-7).toString();
    } else if (unit == 'Square inches (in²)' && unit2 == 'Ares (a)') {
      num = (number1 * 0.0000064516).toString();
    } else if (unit == 'Square inches (in²)' &&
        unit2 == 'Square centimeters (cm²)') {
      num = (number1 * 6.4516).toString();
    } else if (unit == 'Square inches (in²)' && unit2 == 'Hectares (ha)') {
      num = (number1 * 6.45160000E-8).toString();
    } else if (unit == 'Square inches (in²)' && unit2 == 'Square feet (ft²)') {
      num = (number1 * 0.0069444444).toString();
    } else if (unit == 'Square inches (in²)' && unit2 == 'Square meters (m²)') {
      num = (number1 * 0.00064516).toString();
    } else if (unit == 'Square meters (m²)' && unit2 == 'Acres (ac)') {
      num = (number1 * 0.0002471054).toString();
    } else if (unit == 'Square meters (m²)' && unit2 == 'Ares (a)') {
      num = (number1 * 0.01).toString();
    } else if (unit == 'Square meters (m²)' &&
        unit2 == 'Square centimeters (cm²)') {
      num = (number1 * 10000).toString();
    } else if (unit == 'Square meters (m²)' && unit2 == 'Hectares (ha)') {
      num = (number1 * 0.0001).toString();
    } else if (unit == 'Square meters (m²)' && unit2 == 'Square inches (in²)') {
      num = (number1 * 1550.0031000062).toString();
    } else if (unit == 'Square meters (m²)' && unit2 == 'Square feet (ft²)') {
      num = (number1 * 10.7639104167).toString();
    } else {
      num = number1.toString();
    }
    func(num);
  }

  calculateLength() {
    String num = '';
    if (unit == 'Millimeters (mm)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 0.1).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Meters (m)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 0.000001).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Inches (in)') {
      num = (number1 * 0.0393700787).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Feet (ft)') {
      num = (number1 * 0.0032808399).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Yards (yd)') {
      num = (number1 * 0.0010936133).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Miles (mi)') {
      num = (number1 * 6.21371192E-7).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 5.39956803E-7).toString();
    } else if (unit == 'Millimeters (mm)' && unit2 == 'Mils (mil)') {
      num = (number1 * 39.3700787402).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 10).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Meters (m)') {
      num = (number1 * 0.01).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 0.00001).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Inches (in)') {
      num = (number1 * 0.3937007874).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Feet (ft)') {
      num = (number1 * 0.032808399).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Yards (yd)') {
      num = (number1 * 0.010936133).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Miles (mi)') {
      num = (number1 * 0.0000062137).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 0.0000053996).toString();
    } else if (unit == 'Centimeters (cm)' && unit2 == 'Mils (mil)') {
      num = (number1 * 393.7007874016).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 100).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Inches (in)') {
      num = (number1 * 39.3700787402).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Feet (ft)') {
      num = (number1 * 3.280839895).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Yards (yd)') {
      num = (number1 * 1.0936132983).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Miles (mi)') {
      num = (number1 * 0.0006213712).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 0.0005399568).toString();
    } else if (unit == 'Meters (m)' && unit2 == 'Mils (mil)') {
      num = (number1 * 39370.078740158).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 1000000).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 100000).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Meters (m)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Inches (in)') {
      num = (number1 * 39370.078740158).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Feet (ft)') {
      num = (number1 * 3280.8398950131).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Yards (yd)') {
      num = (number1 * 1093.6132983377).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Miles (mi)') {
      num = (number1 * 0.6213711922).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 0.5399568035).toString();
    } else if (unit == 'Kilometers (km)' && unit2 == 'Mils (mil)') {
      num = (number1 * 39370078.740157).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 25.4).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 2.54).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Meters (m)') {
      num = (number1 * 0.0254).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 0.000254).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Feet (ft)') {
      num = (number1 * 0.0833333333).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Yards (yd)') {
      num = (number1 * 0.277777778).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Miles (mi)') {
      num = (number1 * 0.0000157828).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 0.0000137149).toString();
    } else if (unit == 'Inches (in)' && unit2 == 'Mils (mil)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 304.8).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 30.48).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Meters (m)') {
      num = (number1 * 0.3048).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 0.0003048).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Inches (in)') {
      num = (number1 * 12).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Yards (yd)') {
      num = (number1 * 0.333333333).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Miles (mi)') {
      num = (number1 * 0.0001893939).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 0.0001645788).toString();
    } else if (unit == 'Feet (ft)' && unit2 == 'Mils (mil)') {
      num = (number1 * 12000).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 914.4).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 91.44).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Meters (m)') {
      num = (number1 * 0.9144).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 0.0009144).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Inches (in)') {
      num = (number1 * 36).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Feet (ft)') {
      num = (number1 * 3).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Miles (mi)') {
      num = (number1 * 0.0005681818).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 0.0004937365).toString();
    } else if (unit == 'Yards (yd)' && unit2 == 'Mils (mil)') {
      num = (number1 * 36000).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 1609344).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 160934.4).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Meters (m)') {
      num = (number1 * 1609.344).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 1.609344).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Inches (in)') {
      num = (number1 * 63360).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Feet (ft)') {
      num = (number1 * 5280).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Yards (yd)') {
      num = (number1 * 1760).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 0.8689762419).toString();
    } else if (unit == 'Miles (mi)' && unit2 == 'Mils (mil)') {
      num = (number1 * 63360000).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 1852000).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 185200).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Meters (m)') {
      num = (number1 * 1852).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 1.852).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Inches (in)') {
      num = (number1 * 72913.385826772).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Feet (ft)') {
      num = (number1 * 6076.1154855643).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Yards (yd)') {
      num = (number1 * 2025.3718285214).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Miles (mi)') {
      num = (number1 * 1.150779448).toString();
    } else if (unit == 'Nautical miles (NM)' && unit2 == 'Mils (mil)') {
      num = (number1 * 72913385.826772).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Millimeters (mm)') {
      num = (number1 * 0.0254).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Centimeters (cm)') {
      num = (number1 * 0.00254).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Meters (m)') {
      num = (number1 * 0.0000254).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Kilometers (km)') {
      num = (number1 * 2.54000000E-8).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Inches (in)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Feet (ft)') {
      num = (number1 * 0.0000833333).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Yards (yd)') {
      num = (number1 * 0.0000277778).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Miles (mi)') {
      num = (number1 * 1.57828283E-8).toString();
    } else if (unit == 'Mils (mil)' && unit2 == 'Nautical miles (NM)') {
      num = (number1 * 1.37149028E-8).toString();
    } else {
      num = number1.toString();
    }
    func(num);
  }

  calculateTemperature() {
    String num = '';
    if (unit == 'Celsius (˚C)' && unit2 == 'Fahrenheit (˚F)') {
      num = (number1 * 33.8).toString();
    } else if (unit == 'Celsius (˚C)' && unit2 == 'Kelvin (K)') {
      num = (number1 * 274.15).toString();
    } else if (unit == 'Fahrenheit (˚F)' && unit2 == 'Celsius (˚C)') {
      num = (number1 * -17.2222222222).toString();
    } else if (unit == 'Fahrenheit (˚F)' && unit2 == 'Kelvin (K)') {
      num = (number1 * 255.9277777778).toString();
    } else if (unit == 'Kelvin (K)' && unit2 == 'Celsius (˚C)') {
      num = (number1 * -272.15).toString();
    } else if (unit == 'Kelvin (K)' && unit2 == 'Fahrenheit (˚F)') {
      num = (number1 * -457.87).toString();
    } else {
      num = number1.toString();
    }

    func(num);
  }

  calculateVolumes() {
    String num = '';

    if (unit == 'UK gallons (gal)' && unit2 == 'US gallons (gal)') {
      num = (number1 * 1.2009499255).toString();
    } else if (unit == 'UK gallons (gal)' && unit2 == 'Liters (l)') {
      num = (number1 * 4.54609).toString();
    } else if (unit == 'UK gallons (gal)' && unit2 == 'Milliliters (ml)') {
      num = (number1 * 4546.09).toString();
    } else if (unit == 'UK gallons (gal)' &&
        unit2 == 'Cubic centimeters (cm³)') {
      num = (number1 * 4546.09).toString();
    } else if (unit == 'UK gallons (gal)' && unit2 == 'Cubic meters (m³)') {
      num = (number1 * 0.00454609).toString();
    } else if (unit == 'UK gallons (gal)' && unit2 == 'Cubic inches (in³)') {
      num = (number1 * 277.4194327916).toString();
    } else if (unit == 'UK gallons (gal)' && unit2 == 'Cubic feet (ft³)') {
      num = (number1 * 0.1605436532).toString();
    } else if (unit == 'US gallons (gal)' && unit2 == 'UK gallons (gal)') {
      num = (number1 * 0.8326741846).toString();
    } else if (unit == 'US gallons (gal)' && unit2 == 'Liters (l)') {
      num = (number1 * 3.785411784).toString();
    } else if (unit == 'US gallons (gal)' && unit2 == 'Milliliters (ml)') {
      num = (number1 * 3785.411784).toString();
    } else if (unit == 'US gallons (gal)' &&
        unit2 == 'Cubic centimeters (cm³)') {
      num = (number1 * 3785.411784).toString();
    } else if (unit == 'US gallons (gal)' && unit2 == 'Cubic meters (m³)') {
      num = (number1 * 0.0037854118).toString();
    } else if (unit == 'US gallons (gal)' && unit2 == 'Cubic inches (in³)') {
      num = (number1 * 231).toString();
    } else if (unit == 'US gallons (gal)' && unit2 == 'Cubic feet (ft³)') {
      num = (number1 * 0.1336805556).toString();
    } else if (unit == 'Liters (l)' && unit2 == 'UK gallons (gal)') {
      num = (number1 * 0.2199692483).toString();
    } else if (unit == 'Liters (l)' && unit2 == 'US gallons (gal)') {
      num = (number1 * 0.2641720524).toString();
    } else if (unit == 'Liters (l)' && unit2 == 'Milliliters (ml)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Liters (l)' && unit2 == 'Cubic centimeters (cm³)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Liters (l)' && unit2 == 'Cubic meters (m³)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Liters (l)' && unit2 == 'Cubic inches (in³)') {
      num = (number1 * 61.0237440947).toString();
    } else if (unit == 'Liters (l)' && unit2 == 'Cubic feet (ft³)') {
      num = (number1 * 0.035314667).toString();
    } else if (unit == 'Milliliters (ml)' && unit2 == 'UK gallons (gal)') {
      num = (number1 * 0.0002199692).toString();
    } else if (unit == 'Milliliters (ml)' && unit2 == 'US gallons (gal)') {
      num = (number1 * 0.0002641721).toString();
    } else if (unit == 'Milliliters (ml)' && unit2 == 'Liters (l)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Milliliters (ml)' &&
        unit2 == 'Cubic centimeters (cm³)') {
      num = (number1 * 1).toString();
    } else if (unit == 'Milliliters (ml)' && unit2 == 'Cubic meters (m³)') {
      num = (number1 * 0.000001).toString();
    } else if (unit == 'Milliliters (ml)' && unit2 == 'Cubic inches (in³)') {
      num = (number1 * 0.0610237441).toString();
    } else if (unit == 'Milliliters (ml)' && unit2 == 'Cubic feet (ft³)') {
      num = (number1 * 0.0000353147).toString();
    } else if (unit == 'Cubic centimeters (cm³)' &&
        unit2 == 'UK gallons (gal)') {
      num = (number1 * 0.0002199692).toString();
    } else if (unit == 'Cubic centimeters (cm³)' &&
        unit2 == 'US gallons (gal)') {
      num = (number1 * 0.0002641721).toString();
    } else if (unit == 'Cubic centimeters (cm³)' && unit2 == 'Liters (l)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Cubic centimeters (cm³)' &&
        unit2 == 'Milliliters (ml)') {
      num = (number1 * 1).toString();
    } else if (unit == 'Cubic centimeters (cm³)' &&
        unit2 == 'Cubic meters (m³)') {
      num = (number1 * 0.000001).toString();
    } else if (unit == 'Cubic centimeters (cm³)' &&
        unit2 == 'Cubic inches (in³)') {
      num = (number1 * 0.0610237441).toString();
    } else if (unit == 'Cubic centimeters (cm³)' &&
        unit2 == 'Cubic feet (ft³)') {
      num = (number1 * 0.0000353147).toString();
    } else if (unit == 'Cubic meters (m³)' && unit2 == 'UK gallons (gal)') {
      num = (number1 * 219.9692482991).toString();
    } else if (unit == 'Cubic meters (m³)' && unit2 == 'US gallons (gal)') {
      num = (number1 * 264.1720523581).toString();
    } else if (unit == 'Cubic meters (m³)' && unit2 == 'Liters (l)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Cubic meters (m³)' && unit2 == 'Milliliters (ml)') {
      num = (number1 * 1000000).toString();
    } else if (unit == 'Cubic meters (m³)' &&
        unit2 == 'Cubic centimeters (cm³)') {
      num = (number1 * 1000000).toString();
    } else if (unit == 'Cubic meters (m³)' && unit2 == 'Cubic inches (in³)') {
      num = (number1 * 61023.744094732).toString();
    } else if (unit == 'Cubic meters (m³)' && unit2 == 'Cubic feet (ft³)') {
      num = (number1 * 35.3146667215).toString();
    } else if (unit == 'Cubic inches (in³)' && unit2 == 'UK gallons (gal)') {
      num = (number1 * 0.0036046501).toString();
    } else if (unit == 'Cubic inches (in³)' && unit2 == 'US gallons (gal)') {
      num = (number1 * 0.0043290043).toString();
    } else if (unit == 'Cubic inches (in³)' && unit2 == 'Liters (l)') {
      num = (number1 * 0.016387064).toString();
    } else if (unit == 'Cubic inches (in³)' && unit2 == 'Milliliters (ml)') {
      num = (number1 * 16.387064).toString();
    } else if (unit == 'Cubic inches (in³)' &&
        unit2 == 'Cubic centimeters (cm³)') {
      num = (number1 * 16.387064).toString();
    } else if (unit == 'Cubic inches (in³)' && unit2 == 'Cubic meters (m³)') {
      num = (number1 * 0.0000163871).toString();
    } else if (unit == 'Cubic inches (in³)' && unit2 == 'Cubic feet (ft³)') {
      num = (number1 * 0.0005787037).toString();
    } else if (unit == 'Cubic feet (ft³)' && unit2 == 'UK gallons (gal)') {
      num = (number1 * 6.228835459).toString();
    } else if (unit == 'Cubic feet (ft³)' && unit2 == 'US gallons (gal)') {
      num = (number1 * 7.4805194805).toString();
    } else if (unit == 'Cubic feet (ft³)' && unit2 == 'Liters (l)') {
      num = (number1 * 28.316846592).toString();
    } else if (unit == 'Cubic feet (ft³)' && unit2 == 'Milliliters (ml)') {
      num = (number1 * 282316.846592).toString();
    } else if (unit == 'Cubic feet (ft³)' &&
        unit2 == 'Cubic centimeters (cm³)') {
      num = (number1 * 28316.846592).toString();
    } else if (unit == 'Cubic feet (ft³)' && unit2 == 'Cubic meters (m³)') {
      num = (number1 * 0.0283168466).toString();
    } else if (unit == 'Cubic feet (ft³)' && unit2 == 'Cubic inches (in³)') {
      num = (number1 * 1728).toString();
    } else {
      num = number1.toString();
    }

    func(num);
  }

  calculateMass() {
    String num = '';

    if (unit == 'Tons (t)' && unit2 == 'UK tons (t)') {
      num = (number1 * 0.9842065276).toString();
    } else if (unit == 'Tons (t)' && unit2 == 'US tons (t)') {
      num = (number1 * 1.1023113109).toString();
    } else if (unit == 'Tons (t)' && unit2 == 'Pounds (lb)') {
      num = (number1 * 2204.6226218488).toString();
    } else if (unit == 'Tons (t)' && unit2 == 'Ounces (oz)') {
      num = (number1 * 35273.96194958).toString();
    } else if (unit == 'Tons (t)' && unit2 == 'Kilograms (kg)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Tons (t)' && unit2 == 'Grams (g)') {
      num = (number1 * 1000000).toString();
    } else if (unit == 'UK tons (t)' && unit2 == 'Tons (t)') {
      num = (number1 * 1.0160469088).toString();
    } else if (unit == 'UK tons (t)' && unit2 == 'US tons (t)') {
      num = (number1 * 1.12).toString();
    } else if (unit == 'UK tons (t)' && unit2 == 'Pounds (lb)') {
      num = (number1 * 2240).toString();
    } else if (unit == 'UK tons (t)' && unit2 == 'Ounces (oz)') {
      num = (number1 * 35840).toString();
    } else if (unit == 'UK tons (t)' && unit2 == 'Kilograms (kg)') {
      num = (number1 * 1016.0469088).toString();
    } else if (unit == 'UK tons (t)' && unit2 == 'UK tons (t)') {
      num = (number1 * 1016046.9088).toString();
    } else if (unit == 'US tons (t)' && unit2 == 'Tons (t)') {
      num = (number1 * 0.90718474).toString();
    } else if (unit == 'US tons (t)' && unit2 == 'UK tons (t)') {
      num = (number1 * 0.8928571429).toString();
    } else if (unit == 'US tons (t)' && unit2 == 'Pounds (lb)') {
      num = (number1 * 2000).toString();
    } else if (unit == 'US tons (t)' && unit2 == 'Ounces (oz)') {
      num = (number1 * 32000).toString();
    } else if (unit == 'US tons (t)' && unit2 == 'Kilograms (kg)') {
      num = (number1 * 907.18474).toString();
    } else if (unit == 'US tons (t)' && unit2 == 'Grams (g)') {
      num = (number1 * 907184.74).toString();
    } else if (unit == 'Pounds (lb)' && unit2 == 'Tons (t)') {
      num = (number1 * 0.0004535924).toString();
    } else if (unit == 'Pounds (lb)' && unit2 == 'UK tons (t)') {
      num = (number1 * 0.0004464286).toString();
    } else if (unit == 'Pounds (lb)' && unit2 == 'US tons (t)') {
      num = (number1 * 0.0005).toString();
    } else if (unit == 'Pounds (lb)' && unit2 == 'Ounces (oz)') {
      num = (number1 * 16).toString();
    } else if (unit == 'Pounds (lb)' && unit2 == 'Kilograms (kg)') {
      num = (number1 * 0.45359237).toString();
    } else if (unit == 'Pounds (lb)' && unit2 == 'Grams (g)') {
      num = (number1 * 453.59237).toString();
    } else if (unit == 'Ounces (oz)' && unit2 == 'Tons (t)') {
      num = (number1 * 0.0000283495).toString();
    } else if (unit == 'Ounces (oz)' && unit2 == 'UK tons (t)') {
      num = (number1 * 0.0000279018).toString();
    } else if (unit == 'Ounces (oz)' && unit2 == 'US tons (t)') {
      num = (number1 * 0.00003125).toString();
    } else if (unit == 'Ounces (oz)' && unit2 == 'Pounds (lb)') {
      num = (number1 * 0.0625).toString();
    } else if (unit == 'Ounces (oz)' && unit2 == 'Kilograms (kg)') {
      num = (number1 * 0.0283495231).toString();
    } else if (unit == 'Ounces (oz)' && unit2 == 'Grams (g)') {
      num = (number1 * 28.349523125).toString();
    } else if (unit == 'Kilograms (kg)' && unit2 == 'Tons (t)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Kilograms (kg)' && unit2 == 'UK tons (t)') {
      num = (number1 * 0.0009842065).toString();
    } else if (unit == 'Kilograms (kg)' && unit2 == 'US tons (t)') {
      num = (number1 * 0.0011023113).toString();
    } else if (unit == 'Kilograms (kg)' && unit2 == 'Pounds (lb)') {
      num = (number1 * 2.2046226218).toString();
    } else if (unit == 'Kilograms (kg)' && unit2 == 'Ounces (oz)') {
      num = (number1 * 35.2739619496).toString();
    } else if (unit == 'Kilograms (kg)' && unit2 == 'Grams (g)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Grams (g)' && unit2 == 'Tons (t)') {
      num = (number1 * 0.000001).toString();
    } else if (unit == 'Grams (g)' && unit2 == 'UK tons (t)') {
      num = (number1 * 9.84206528E-7).toString();
    } else if (unit == 'Grams (g)' && unit2 == 'US tons (t)') {
      num = (number1 * 0.0000011023).toString();
    } else if (unit == 'Grams (g)' && unit2 == 'Pounds (lb)') {
      num = (number1 * 0.0022046226).toString();
    } else if (unit == 'Grams (g)' && unit2 == 'Ounces (oz)') {
      num = (number1 * 0.0352739619).toString();
    } else if (unit == 'Grams (g)' && unit2 == 'Kilograms (kg)') {
      num = (number1 * 0.001).toString();
    } else {
      num = number1.toString();
    }

    func(num);
  }

  calculateData() {
    String num = '';

    if (unit == 'Bits (bit)' && unit2 == 'Bytes (B)') {
      num = (number1 * 0.125).toString();
    } else if (unit == 'Bits (bit)' && unit2 == 'Kilobytes (KB)') {
      num = (number1 * 0.0001220703).toString();
    } else if (unit == 'Bits (bit)' && unit2 == 'Megabytes (MB)') {
      num = (number1 * 1.19209290E-7).toString();
    } else if (unit == 'Bits (bit)' && unit2 == 'Gigabytes (GB)') {
      num = (number1 * 1.16415322E-10).toString();
    } else if (unit == 'Bits (bit)' && unit2 == 'Terabytes (TB)') {
      num = (number1 * 1.13686838E-13).toString();
    } else if (unit == 'Bytes (B)' && unit2 == 'Bits (bit)') {
      num = (number1 * 8).toString();
    } else if (unit == 'Bytes (B)' && unit2 == 'Kilobytes (KB)') {
      num = (number1 * 0.0009765625).toString();
    } else if (unit == 'Bytes (B)' && unit2 == 'Megabytes (MB)') {
      num = (number1 * 9.53674316E-7).toString();
    } else if (unit == 'Bytes (B)' && unit2 == 'Gigabytes (GB)') {
      num = (number1 * 9.31322575E-10).toString();
    } else if (unit == 'Bytes (B)' && unit2 == 'Terabytes (TB)') {
      num = (number1 * 9.09494702E-13).toString();
    } else if (unit == 'Kilobytes (KB)' && unit2 == 'Bytes (B)') {
      num = (number1 * 1024).toString();
    } else if (unit == 'Kilobytes (KB)' && unit2 == 'Bits (bit)') {
      num = (number1 * 8192).toString();
    } else if (unit == 'Kilobytes (KB)' && unit2 == 'Megabytes (MB)') {
      num = (number1 * 0.0009765625).toString();
    } else if (unit == 'Kilobytes (KB)' && unit2 == 'Gigabytes (GB)') {
      num = (number1 * 9.53674316E-7).toString();
    } else if (unit == 'Kilobytes (KB)' && unit2 == 'Terabytes (TB)') {
      num = (number1 * 9.31322575E-10).toString();
    } else if (unit == 'Megabytes (MB)' && unit2 == 'Bytes (B)') {
      num = (number1 * 1048576).toString();
    } else if (unit == 'Megabytes (MB)' && unit2 == 'Kilobytes (KB)') {
      num = (number1 * 0.0001220703).toString();
    } else if (unit == 'Megabytes (MB)' && unit2 == 'Bits (bit)') {
      num = (number1 * 8388608).toString();
    } else if (unit == 'Megabytes (MB)' && unit2 == 'Gigabytes (GB)') {
      num = (number1 * 0.0009765625).toString();
    } else if (unit == 'Megabytes (MB)' && unit2 == 'Terabytes (TB)') {
      num = (number1 * 9.53674316E-7).toString();
    } else if (unit == 'Gigabytes (GB)' && unit2 == 'Bytes (B)') {
      num = (number1 * 1073741824).toString();
    } else if (unit == 'Gigabytes (GB)' && unit2 == 'Kilobytes (KB)') {
      num = (number1 * 1048576).toString();
    } else if (unit == 'Gigabytes (GB)' && unit2 == 'Megabytes (MB)') {
      num = (number1 * 1024).toString();
    } else if (unit == 'Gigabytes (GB)' && unit2 == 'Bits (bit)') {
      num = (number1 * 8589934592).toString();
    } else if (unit == 'Gigabytes (GB)' && unit2 == 'Terabytes (TB)') {
      num = (number1 * 0.0009765625).toString();
    } else if (unit == 'Terabytes (TB)' && unit2 == 'Bytes (B)') {
      num = (number1 * 1099511627776).toString();
    } else if (unit == 'Terabytes (TB)' && unit2 == 'Kilobytes (KB)') {
      num = (number1 * 1073741824).toString();
    } else if (unit == 'Terabytes (TB)' && unit2 == 'Megabytes (MB)') {
      num = (number1 * 1048576).toString();
    } else if (unit == 'Terabytes (TB)' && unit2 == 'Gigabytes (GB)') {
      num = (number1 * 1024).toString();
    } else if (unit == 'Terabytes (TB)' && unit2 == 'Bits (bit)') {
      num = (number1 * 8796093022208).toString();
    } else {
      num = number1.toString();
    }

    func(num);
  }

  calculateSpeed() {
    String num = '';

    if (unit == 'Meters per second (m/s)' && unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 3600).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 0.01).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 3.6).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 39.3700787402).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 141732.28346457).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 3.280839895).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 11811.023622047).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 0.0006213712).toString();
    } else if (unit == 'Meters per second (m/s)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 2.2369362921).toString();
    } else if (unit == 'Meters per second (m/s)' && unit2 == 'Knots (kn)') {
      num = (number1 * 1.9438444924).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Meters per second (m/s)') {
      num = (number1 * 0.0002777778).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 2.77777778E-7).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 0.010936133).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 39.3700787402).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 0.0009113444).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 3.280839895).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 1.72603109E-7).toString();
    } else if (unit == 'Meters per hour (m/h)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 0.0006213712).toString();
    } else if (unit == 'Meters per hour (m/h)' && unit2 == 'Knots (kn)') {
      num = (number1 * 0.0005399568).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 3600000).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Meters per second (m/s)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 3600).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 39370.078740158).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 141732283.46457).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 3280.8398950131).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 11811023.622047).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 0.6213711922).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 2236.9362920544).toString();
    } else if (unit == 'Kilometers per second (km/s)' &&
        unit2 == 'Knots (kn)') {
      num = (number1 * 1943.8444924406).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 0.0002777778).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Meters per second (m/s)') {
      num = (number1 * 0.277777778).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 10.9361329834).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 39370.078740158).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 0.9113444153).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 3280.8398950131).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 0.0001726031).toString();
    } else if (unit == 'Kilometers per hour (km/h)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 0.6213711922).toString();
    } else if (unit == 'Kilometers per hour (km/h)' && unit2 == 'Knots (kn)') {
      num = (number1 * 0.5399568035).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 91.44).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 0.0000254).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 0.09144).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Meters per second (m/s)') {
      num = (number1 * 0.0254).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 3600).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 0.0833333333).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 300).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 0.0000157828).toString();
    } else if (unit == 'Inches per second (in/s)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 0.0568181818).toString();
    } else if (unit == 'Inches per second (in/s)' && unit2 == 'Knots (kn)') {
      num = (number1 * 0.0493736501).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 0.0254).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 7.055555556E-9).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 0.0000254).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 0.0002777778).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Meters per scond') {
      num = (number1 * 0.0000070556).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 0.0000231).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 0.083333333333).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 4.38411897E-9).toString();
    } else if (unit == 'Inches per hour (in/h)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 0.0000157828).toString();
    } else if (unit == 'Inches per hour (in/h)' && unit2 == 'Knots (kn)') {
      num = (number1 * 0.0000137149).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 1097.28).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 0.0003048).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 1.09728).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 12).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 43200).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Meters per Seconds (s)') {
      num = (number1 * 0.3048).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 3600).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 0.0001893939).toString();
    } else if (unit == 'Feet per second (ft/s)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 0.6818181818).toString();
    } else if (unit == 'Feet per second (ft/s)' && unit2 == 'Knots (kn)') {
      num = (number1 * 0.5924838013).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 0.3048).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 8.4666666667E-8).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 0.0003048).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 0.00333333333).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 12).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 0.0002777778).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Meters per second (m/s)') {
      num = (number1 * 0.000084667).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 5.26094276E-8).toString();
    } else if (unit == 'Feet per hour (ft/h)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 0.0001893939).toString();
    } else if (unit == 'Feet per hour (ft/h)' && unit2 == 'Knots (kn)') {
      num = (number1 * 0.0001645788).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 5793638.4).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 1.609344).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 5793.6384).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 63360).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 228096000).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 5280).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 19008000).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Meters per second (m/s)') {
      num = (number1 * 1609.344).toString();
    } else if (unit == 'Miles per second (mi/s)' &&
        unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 3600).toString();
    } else if (unit == 'Miles per second (mi/s)' && unit2 == 'Knots (kn)') {
      num = (number1 * 3128.3144708423).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 1609.344).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 0.00044704).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 1.609344).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Inches per second (in/s)') {
      num = (number1 * 17.6).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 63360).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 1.466666667).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 5280).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 0.0002777778).toString();
    } else if (unit == 'Miles per hour (mi/h)' &&
        unit2 == 'Meters per second (m/s)') {
      num = (number1 * 0.44704).toString();
    } else if (unit == 'Miles per hour (mi/h)' && unit2 == 'Knots (kn)') {
      num = (number1 * 0.8689762419).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Meters per hour (m/h)') {
      num = (number1 * 1852).toString();
    } else if (unit == 'Knots (kn)' &&
        unit2 == 'Kilometers per second (km/s)') {
      num = (number1 * 0.0005144444).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Kilometers per hour (km/h)') {
      num = (number1 * 1.852).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Inches per second (in/s)') {
      num = (number1 * 20.2537182852).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Inches per hour (in/h)') {
      num = (number1 * 72913.385826772).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Feet per second (ft/s)') {
      num = (number1 * 1.6878098571).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Feet per hour (ft/h)') {
      num = (number1 * 6076.1154855643).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Miles per second (mi/s)') {
      num = (number1 * 0.000319661).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Miles per hour (mi/h)') {
      num = (number1 * 1.150779448).toString();
    } else if (unit == 'Knots (kn)' && unit2 == 'Meters per second (m/s)') {
      num = (number1 * 0.5144444444).toString();
    } else {
      num = number1.toString();
    }

    func(num);
  }

  calculateTime() {
    String num = '';

    if (unit == 'Milliseconds (ms)' && unit2 == 'Seconds (s)') {
      num = (number1 * 0.001).toString();
    } else if (unit == 'Milliseconds (ms)' && unit2 == 'Minutes (min)') {
      num = (number1 * 0.00001666667).toString();
    } else if (unit == 'Milliseconds (ms)' && unit2 == 'Hours (h)') {
      num = (number1 * 2.777777778E-7).toString();
    } else if (unit == 'Milliseconds (ms)' && unit2 == 'Days (d)') {
      num = (number1 * 1.15740741E-8).toString();
    } else if (unit == 'Milliseconds (ms)' && unit2 == 'Weeks (wk)') {
      num = (number1 * 1.65343915E-9).toString();
    } else if (unit == 'Seconds (s)' && unit2 == 'Milliseconds (ms)') {
      num = (number1 * 1000).toString();
    } else if (unit == 'Seconds (s)' && unit2 == 'Minutes (min)') {
      num = (number1 * 0.0166666667).toString();
    } else if (unit == 'Seconds (s)' && unit2 == 'Hours (h)') {
      num = (number1 * 0.00027777778).toString();
    } else if (unit == 'Seconds (s)' && unit2 == 'Days (d)') {
      num = (number1 * 0.0000115741).toString();
    } else if (unit == 'Seconds (s)' && unit2 == 'Weeks (wk)') {
      num = (number1 * 0.0000016534).toString();
    } else if (unit == 'Minutes (min)' && unit2 == 'Seconds (s)') {
      num = (number1 * 60).toString();
    } else if (unit == 'Minutes (min)' && unit2 == 'Milliseconds (ms)') {
      num = (number1 * 60000).toString();
    } else if (unit == 'Minutes (min)' && unit2 == 'Hours (h)') {
      num = (number1 * 0.0166666667).toString();
    } else if (unit == 'Minutes (min)' && unit2 == 'Days (d)') {
      num = (number1 * 0.0006944444).toString();
    } else if (unit == 'Minutes (min)' && unit2 == 'Weeks (wk)') {
      num = (number1 * 0.0000992063).toString();
    } else if (unit == 'Hours (h)' && unit2 == 'Seconds (s)') {
      num = (number1 * 3600).toString();
    } else if (unit == 'Hours (h)' && unit2 == 'Minutes (min)') {
      num = (number1 * 60).toString();
    } else if (unit == 'Hours (h)' && unit2 == 'Milliseconds (ms)') {
      num = (number1 * 3600000).toString();
    } else if (unit == 'Hours (h)' && unit2 == 'Days (d)') {
      num = (number1 * 0.0416666667).toString();
    } else if (unit == 'Hours (h)' && unit2 == 'Weeks (wk)') {
      num = (number1 * 0.005952381).toString();
    } else if (unit == 'Days (d)' && unit2 == 'Seconds (s)') {
      num = (number1 * 86400).toString();
    } else if (unit == 'Days (d)' && unit2 == 'Minutes (min)') {
      num = (number1 * 1440).toString();
    } else if (unit == 'Days (d)' && unit2 == 'Hours (h)') {
      num = (number1 * 24).toString();
    } else if (unit == 'Days (d)' && unit2 == 'Milliseconds (ms)') {
      num = (number1 * 86400000).toString();
    } else if (unit == 'Days (d)' && unit2 == 'Weeks (wk)') {
      num = (number1 * 0.1428571429).toString();
    } else if (unit == 'Weeks (wk)' && unit2 == 'Seconds (s)') {
      num = (number1 * 604800).toString();
    } else if (unit == 'Weeks (wk)' && unit2 == 'Minutes (min)') {
      num = (number1 * 10080).toString();
    } else if (unit == 'Weeks (wk)' && unit2 == 'Hours (h)') {
      num = (number1 * 168).toString();
    } else if (unit == 'Weeks (wk)' && unit2 == 'Days (d)') {
      num = (number1 * 7).toString();
    } else if (unit == 'Weeks (wk)' && unit2 == 'Milliseconds (ms)') {
      num = (number1 * 604800000).toString();
    } else {
      num = number1.toString();
    }

    func(num);
  }
}

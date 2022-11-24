abstract class FormatText {
  static String removeHtmlTags(String text) {
    text = text.replaceAll(RegExp('&lt;'), '<');
    text = text.replaceAll(RegExp('&gt;'), '>');
    text = text.replaceAll(RegExp('&amp;'), '&');
    text = text.replaceAll(RegExp('&aacute;'), 'á');
    text = text.replaceAll(RegExp('&acirc;'), 'â');
    text = text.replaceAll(RegExp('&agrave;'), 'à');
    text = text.replaceAll(RegExp('&atilde;'), 'ã');
    text = text.replaceAll(RegExp('&ccedil;'), 'ç');
    text = text.replaceAll(RegExp('&eacute;'), 'é');
    text = text.replaceAll(RegExp('&ecirc;'), 'ê');
    text = text.replaceAll(RegExp('&iacute;'), 'í');
    text = text.replaceAll(RegExp('&oacute;'), 'ó');
    text = text.replaceAll(RegExp('&ocirc;'), 'ô');
    text = text.replaceAll(RegExp('&otilde;'), 'õ');
    text = text.replaceAll(RegExp('&uacute;'), 'ú');
    text = text.replaceAll(RegExp('&uuml;'), 'ü');
    text = text.replaceAll(RegExp('&Aacute;'), 'Á');
    text = text.replaceAll(RegExp('&Acirc;'), 'Â');
    text = text.replaceAll(RegExp('&Agrave;'), 'À');
    text = text.replaceAll(RegExp('&Atilde;'), 'Ã');
    text = text.replaceAll(RegExp('&Ccedil;'), 'Ç');
    text = text.replaceAll(RegExp('&Eacute;'), 'É');
    text = text.replaceAll(RegExp('&Ecirc;'), 'Ê');
    text = text.replaceAll(RegExp('&Iacute;'), 'Í');
    text = text.replaceAll(RegExp('&Oacute;'), 'Ó');
    text = text.replaceAll(RegExp('&Ocirc;'), 'Ô');
    text = text.replaceAll(RegExp('&Otilde;'), 'Õ');
    text = text.replaceAll(RegExp('&Uacute;	'), 'Ú');
    text = text.replaceAll(RegExp('&Uuml;'), 'Ü');
    text = text.replaceAll(RegExp('&nbsp;'), ' ');
    text = text.replaceAll(RegExp('\\r\\n\\t'), '');
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  }
}
import 'package:get/get.dart';

class MyTranslations extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':en_US,
    'de_DE':de_DE
  };

}


const en_US = {
  'appTitle': 'Ahmad Demo',
  'conversation': 'Conversation',
  'dialogs': 'Dialogs',
  'chats': 'Chats',
  'profile': 'Profile',
  'addNew': 'Add New',
  'search': 'Search',
  'channels': 'Channels',
  'longTimeAgo': 'Long Time ago',
  'type': 'Type Something',
};

const de_DE = {
  'appTitle': 'Ahmad Demo',
  'conversation': 'Gesprek',
  'dialogs': 'Dialogen',
  'chats': 'Chatten',
  'profile': 'Profiel',
  'addNew': 'Nieuw Toevoegen',
  'search': 'zoeken',
  'channels': 'kanalen',
  'longTimeAgo': 'Lang Geleden',
  'type': 'Typ iets',
};
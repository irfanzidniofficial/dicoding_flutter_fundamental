import 'package:flutter_test/flutter_test.dart';
import 'package:widgettesting/provider/done_module_provider.dart';

void main() {
  test("should contain new item when module completed", () {
    // arrange : agian di mana kita menyiapkan objek dan pengaturan yang akan diuji
    var doneModuleProvider = DoneModuleProvider();
    var testModuleName = 'Test Module';

    // act :  aksi yang ingin dijalankan
    doneModuleProvider.complete(testModuleName);

    // assert: memverifikasi nilai yang diekspektasikan dengan hasil pemanggilan metode ketika Act.
    var result = doneModuleProvider.doneModuleList.contains(testModuleName);
    expect(result, true);
  });
  // Mengelompokan beberapa test ke group

  group('Provider Test', () {
    test('should contain new item when module completed', () {});

    test('Another test case', () {});
  });

  // Tips: S, apabila bagian arrange digunakan di seluruh test Anda, maka Anda bisa mengeluarkan inisialisasi variabel dan memanfaatkan fungsi setUp(). Fungsi setUp() akan dijalankan setiap sebelum setiap pengujian dari fungsi test().
  group('Provider Test', () {
    const testModuleName = 'Test Module';
    late DoneModuleProvider doneModuleProvider;

    setUp(() {
      // arrange
      doneModuleProvider = DoneModuleProvider();
    });

    test('should contain new item when module completed', () {
      // act
      doneModuleProvider.complete(testModuleName);
      // assert
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);
      expect(result, true);
    });
  });
}

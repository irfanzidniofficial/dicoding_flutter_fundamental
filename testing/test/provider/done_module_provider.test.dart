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
}

import 'package:flutter/material.dart';

void main() => runApp(const IDBIStyleDemoApp());

const idbiGreen = Color(0xFF087A4B);
const idbiDarkGreen = Color(0xFF005D3A);
const idbiLight = Color(0xFFF4F8F5);
const idbiGold = Color(0xFFD6A646);

class IDBIStyleDemoApp extends StatelessWidget {
  const IDBIStyleDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IDBI Bank UI Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: idbiGreen),
        scaffoldBackgroundColor: idbiLight,
        appBarTheme: const AppBarTheme(
          backgroundColor: idbiGreen,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(backgroundColor: idbiGreen),
        ),
      ),
      home: const SplashPage(),
    );
  }
}

class DemoMark extends StatelessWidget {
  const DemoMark({super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: const Color(0xFFFFF1C9),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: const Text(
          '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
        ),
      );
}

class BrandMark extends StatelessWidget {
  final double size;
  const BrandMark({super.key, this.size = 84});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size * .22),
          boxShadow: const [BoxShadow(blurRadius: 18, color: Color(0x22000000))],
        ),
        child: Padding(
          padding: EdgeInsets.all(size * .13),
          child: Image.asset('assets/images/project_logo.jpeg', fit: BoxFit.contain),
        ),
      );
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1100), () {
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: idbiGreen,
        body: SafeArea(
          child: Column(
            children: [
              const DemoMark(),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      BrandMark(size: 105),
                      SizedBox(height: 22),
                      Text('IDBI Bank UI Demo',
                          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
                      SizedBox(height: 7),
                      Text('GO Mobile+ inspired student interface',
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pin = TextEditingController();
  @override
  void dispose() { pin.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const DemoMark(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 38, 24, 24),
                  child: Column(
                    children: [
                      const BrandMark(size: 90),
                      const SizedBox(height: 18),
                      const Text('Welcome', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 6),
                      const Text('Sign in to IDBI Bank', style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 32),
                      TextField(
                        controller: pin,
                        maxLength: 4,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter your MPIN',
                          hintText: 'Enter any 4 digits',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity, height: 52,
                        child: FilledButton(
                          onPressed: () {
                            if (pin.text.length == 4) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeShell()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('For this bank, enter any 4 digits.')),
                              );
                            }
                          },
                          child: const Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w800)),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.fingerprint, size: 28, color: idbiGreen),
                          SizedBox(width: 8),
                          Text('Biometric login', style: TextStyle(color: idbiGreen, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const SizedBox(height: 26),
                      const Text(
                        'Connection to IDBI Bank or any payment network. Never enter a real MPIN, OTP, password or account credential.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;
  final pages = const [DashboardPage(), AccountsPage(), ServicesPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(children: [const DemoMark(), Expanded(child: pages[index])]),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          indicatorColor: const Color(0xFFDDEFE6),
          onDestinationSelected: (v) => setState(() => index = v),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.account_balance_outlined), label: 'Accounts'),
            NavigationDestination(icon: Icon(Icons.apps), label: 'Services'),
            NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      );
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget action(BuildContext context, IconData icon, String label, Widget page) => InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 102, height: 92,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, color: idbiGreen, size: 28),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          ]),
        ),
      );

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(children: [
            const BrandMark(size: 48),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Good day,', style: TextStyle(color: Colors.black54)),
              Text('Mirza Arshi abbas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            ])),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          ]),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [idbiGreen, idbiDarkGreen]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('SAVINGS ACCOUNT', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
                Icon(Icons.visibility_outlined, color: Colors.white),
              ]),
              SizedBox(height: 18),
              Text('Available Balance', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 4),
              Text('₹ 24,860.50', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800)),
              SizedBox(height: 8),
              Text('A/C •••• 0256', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 18),
              Divider(color: Colors.white24),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Lien Amount', style: TextStyle(color: Colors.white)),
                Text('₹ 20,000.00', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
              ]),
              SizedBox(height: 5),
              Text('Amount', style: TextStyle(color: Colors.white60, fontSize: 11)),
            ]),
          ),
          const SizedBox(height: 22),
          const Text('Quick Banking', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Wrap(spacing: 10, runSpacing: 10, children: [
            action(context, Icons.swap_horiz, 'Fund Transfer', const TransferPage()),
            action(context, Icons.qr_code_scanner, 'Scan & Pay', const InfoPage(title: 'Scan & Pay')),
            action(context, Icons.receipt_long_outlined, 'Bill Pay', const InfoPage(title: 'Bill Payments')),
            action(context, Icons.phone_android, 'Recharge', const InfoPage(title: 'Mobile Recharge')),
            action(context, Icons.credit_card, 'Cards', const CardControlsPage()),
            action(context, Icons.savings_outlined, 'Deposits', const DepositsPage()),
          ]),
          const SizedBox(height: 22),
          const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          const TransactionTile(title: 'MACHINDRE VINIT NILESH', subtitle: '01 Oct, 2026 • UPI/615092084456', amount: '+ ₹20,000.00'),
          const TransactionTile(title: 'MAFROOZA BANU', subtitle: '30 Sep, 2026 • UPI/663989482173', amount: '- ₹100.00'),
          const TransactionTile(title: 'NAZIYA ZEHRA', subtitle: '30 Sep, 2026 • UPI/663876995223', amount: '- ₹610.00'),
        ],
      );
}

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('My Accounts', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 14),
          Card(child: ListTile(
            leading: const CircleAvatar(backgroundColor: Color(0xFFDDEFE6), child: Icon(Icons.account_balance, color: idbiGreen)),
            title: const Text('Savings Account •••• 0256', style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('Available ₹24,860.50  •  Lien ₹20,000.00'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TransactionsPage())),
          )),
          const SizedBox(height: 16),
          const Text('Account tools', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          Card(child: ListTile(leading: const Icon(Icons.article_outlined), title: const Text('Account Statement'), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TransactionsPage())))),
          Card(child: ListTile(leading: const Icon(Icons.book_outlined), title: const Text('Passbook'), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TransactionsPage())))),
        ],
      );
}

class TransactionTile extends StatelessWidget {
  final String title, subtitle, amount;
  const TransactionTile({super.key, required this.title, required this.subtitle, required this.amount});
  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(backgroundColor: Color(0xFFDDEFE6), child: Icon(Icons.currency_rupee, color: idbiGreen)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.w800)),
      );
}

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Account Activity')),
        body: ListView(padding: const EdgeInsets.all(18), children: const [
          DemoMark(),
          SizedBox(height: 16),
          Text('Savings Account •••• 0256', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          Text('Recent Transactions.', style: TextStyle(color: Colors.black54)),
          SizedBox(height: 12),
          TransactionTile(title: 'MACHINDRE VINIT NILESH', subtitle: '01 Oct, 2026 • UPI/615092084456', amount: '+ ₹20,000.00'),
          TransactionTile(title: 'MAFROOZA BANU', subtitle: '30 Sep, 2026 • UPI/663989482173', amount: '- ₹100.00'),
          TransactionTile(title: 'NAZIYA ZEHRA', subtitle: '30 Sep, 2026 • UPI/663876995223', amount: '- ₹610.00'),
          TransactionTile(title: 'YUVRAJ', subtitle: '28 Sep, 2026 • UPI/627409836295', amount: '+ ₹220.00'),
          TransactionTile(title: 'Hyder Masoom', subtitle: '28 Sep, 2026 • UPI/67853249071', amount: '- ₹190.00'),
        ]),
      );
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = <(String, IconData, Widget)>[
      ('Fund Transfer', Icons.swap_horiz, const TransferPage()),
      ('Manage Beneficiary', Icons.people_outline, const InfoPage(title: 'Manage Beneficiary')),
      ('UPI Services', Icons.qr_code_2, const InfoPage(title: 'UPI Services')),
      ('Bill Payments & Recharge', Icons.receipt_long_outlined, const InfoPage(title: 'Bill Payments & Recharge')),
      ('Debit Card Services', Icons.credit_card, const CardControlsPage()),
      ('Fixed / Recurring Deposit', Icons.savings_outlined, const DepositsPage()),
      ('Cheque Services', Icons.description_outlined, const InfoPage(title: 'Cheque Services')),
      ('Account Statement', Icons.article_outlined, const TransactionsPage()),
      ('Service Requests', Icons.support_agent, const InfoPage(title: 'Service Requests')),
    ];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Banking Services', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        ...items.map((e) => Card(child: ListTile(
          leading: CircleAvatar(backgroundColor: const Color(0xFFDDEFE6), child: Icon(e.$2, color: idbiGreen)),
          title: Text(e.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => e.$3)),
        ))),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Profile & Settings', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 14),
          const Card(child: ListTile(
            leading: CircleAvatar(backgroundColor: idbiGreen, foregroundColor: Colors.white, child: Icon(Icons.person)),
            title: Text('Mirza Arshi Abbas', style: TextStyle(fontWeight: FontWeight.w800)),
          )),
          const Card(child: ListTile(leading: Icon(Icons.security), title: Text('Security Settings'), trailing: Icon(Icons.chevron_right))),
          const Card(child: ListTile(leading: Icon(Icons.language), title: Text('Language'), trailing: Icon(Icons.chevron_right))),
          const Card(child: ListTile(leading: Icon(Icons.help_outline), title: Text('Help & Support'), trailing: Icon(Icons.chevron_right))),
          Card(child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginPage()), (_) => false),
          )),
        ],
      );
}

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});
  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final beneficiary = TextEditingController();
  final amount = TextEditingController();
  @override
  void dispose() { beneficiary.dispose(); amount.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Fund Transfer • Demo')),
        body: ListView(padding: const EdgeInsets.all(18), children: [
          const DemoMark(),
          const SizedBox(height: 18),
          const Text('Transfer money', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          const Text('Local simulation only — no money can be sent.', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: 'IMPS',
            items: const ['IMPS', 'NEFT', 'Within Bank'].map((x) => DropdownMenuItem(value: x, child: Text('$x • Demo'))).toList(),
            onChanged: (_) {},
            decoration: const InputDecoration(labelText: 'Transfer mode', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 14),
          TextField(controller: beneficiary, decoration: const InputDecoration(labelText: 'Demo beneficiary', hintText: 'Example: Project User', border: OutlineInputBorder())),
          const SizedBox(height: 14),
          TextField(controller: amount, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Amount', prefixText: '₹ ', border: OutlineInputBorder())),
          const SizedBox(height: 18),
          SizedBox(height: 50, child: FilledButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (c) => AlertDialog(
                title: const Text('Demo transaction'),
                content: Text('Simulation completed. No money was transferred.\n\nAmount: ₹${amount.text.isEmpty ? '0' : amount.text}'),
                actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('OK'))],
              ),
            ),
            child: const Text('CONTINUE DEMO'),
          )),
        ]),
      );
}

class CardControlsPage extends StatefulWidget {
  const CardControlsPage({super.key});
  @override
  State<CardControlsPage> createState() => _CardControlsPageState();
}

class _CardControlsPageState extends State<CardControlsPage> {
  bool online = true, contactless = true, atm = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Debit Card Services')),
        body: ListView(padding: const EdgeInsets.all(18), children: [
          const DemoMark(),
          const SizedBox(height: 16),
          Container(
            height: 190, padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(gradient: const LinearGradient(colors: [idbiGreen, idbiDarkGreen]), borderRadius: BorderRadius.circular(18)),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('DEMO DEBIT CARD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
              Spacer(),
              Text('••••  ••••  ••••  0256', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
              SizedBox(height: 10),
              Text('DEMO CUSTOMER      VALID 12/30', style: TextStyle(color: Colors.white70)),
            ]),
          ),
          const SizedBox(height: 12),
          SwitchListTile(title: const Text('Online transactions'), value: online, onChanged: (v) => setState(() => online = v)),
          SwitchListTile(title: const Text('Contactless payments'), value: contactless, onChanged: (v) => setState(() => contactless = v)),
          SwitchListTile(title: const Text('ATM withdrawals'), value: atm, onChanged: (v) => setState(() => atm = v)),
          const Text('These controls affect only this local UI demo.', style: TextStyle(color: Colors.black54)),
        ]),
      );
}

class DepositsPage extends StatelessWidget {
  const DepositsPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Deposits')),
        body: ListView(padding: const EdgeInsets.all(18), children: const [
          DemoMark(),
          SizedBox(height: 18),
          Text('Deposit Products', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          SizedBox(height: 10),
          Card(child: ListTile(leading: Icon(Icons.lock_clock_outlined, color: idbiGreen), title: Text('Fixed Deposit'), subtitle: Text('Demo FD opening flow'), trailing: Icon(Icons.chevron_right))),
          Card(child: ListTile(leading: Icon(Icons.calendar_month_outlined, color: idbiGreen), title: Text('Recurring Deposit'), subtitle: Text('Demo monthly deposit flow'), trailing: Icon(Icons.chevron_right))),
          SizedBox(height: 12),
          Card(child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Demo FD •••• 1024', style: TextStyle(fontWeight: FontWeight.w800)),
              SizedBox(height: 8),
              Text('Principal   ₹ 50,000.00'),
              Text('Maturity    ₹ 53,240.00'),
              Text('Status      Active (simulation)'),
            ]),
          )),
        ]),
      );
}

class InfoPage extends StatelessWidget {
  final String title;
  const InfoPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DemoMark(),
            SizedBox(height: 24),
            Icon(Icons.account_balance, color: idbiGreen, size: 42),
            SizedBox(height: 14),
            Text('Student project module', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
            SizedBox(height: 8),
            Text('IDBI Bank, UPI, NPCI or any payment network.'),
          ]),
        ),
      );
}

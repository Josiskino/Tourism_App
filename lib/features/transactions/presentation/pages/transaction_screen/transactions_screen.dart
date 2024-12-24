// activities_screen.dart
import 'package:flutter/material.dart';
import 'widgets/activity_search_bar.dart';
import 'widgets/invitation_card.dart';
import 'widgets/stats_cards_row.dart';
import 'widgets/transaction_list.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Trips'),
              Tab(text: 'Tourist Sites'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _TripsTab(),
            _TouristSitesTab(),
          ],
        ),
      ),
    );
  }
}

class _TripsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: ActivitySearchBar(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverToBoxAdapter(
            child: StatsCardsRow(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: TransactionListView(),
        ),
      ],
    );
  }
}

class _TouristSitesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: ActivitySearchBar(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverToBoxAdapter(
            //child: TouristStatsCards(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: InvitationCard(),
          ),
        ),
      ],
    );
  }
}
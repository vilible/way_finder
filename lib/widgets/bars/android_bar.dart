import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:way_finder/widgets/action_button.dart";
import "package:way_finder/widgets/menu/tabs/settings.dart";
import "package:way_finder/widgets/menu/tabs/trajectory.dart";

class AndroidBar extends StatelessWidget implements PreferredSizeWidget {
  const AndroidBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          style: GoogleFonts.pacifico(fontSize: 24),
          children: [
            TextSpan(
              text: "Way",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            TextSpan(
              text: "Finder",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      actions: const [
        ActionButton(
          icon: Icons.directions_outlined,
          child: TrajectoryTab(),
        ),
        ActionButton(
          icon: Icons.settings_outlined,
          child: SettingsTab(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

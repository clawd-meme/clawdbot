package ai.clawdbot.android.ui

import androidx.compose.runtime.Composable
import ai.clawdbot.android.MainViewModel
import ai.clawdbot.android.ui.chat.ChatSheetContent

@Composable
fun ChatSheet(viewModel: MainViewModel) {
  ChatSheetContent(viewModel = viewModel)
}

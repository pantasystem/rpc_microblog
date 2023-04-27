
import 'package:client/generated/proto/statuses.pb.dart';

Status getContentStatus(Status status) {
  if (status.content.isNotEmpty) {
    return status;
  }

  if (status.hasReblog()) {
    return status.reblog;
  }

  return status;
}

bool isReblog(Status status) {
  return status.hasReblog();
}

bool isReply(Status status) {
  return status.hasReplyTo();
}
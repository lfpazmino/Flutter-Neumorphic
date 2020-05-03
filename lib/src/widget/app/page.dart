// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Just an extension of MaterialPageRoute
class NeumorphicPageRoute<T> extends MaterialPageRoute<T> {

  NeumorphicPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        assert(opaque),
        super(
          //added
          builder:builder,
          maintainState: maintainState,

          settings: settings,
          fullscreenDialog: fullscreenDialog
      );
}

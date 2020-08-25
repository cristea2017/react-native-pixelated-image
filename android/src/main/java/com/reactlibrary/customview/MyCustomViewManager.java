package com.reactlibrary;

import android.content.Context;
import android.view.LayoutInflater;

import com.facebook.react.common.MapBuilder.Builder;

import com.reactlibrary.R;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

import java.util.Map;

public class MyCustomViewManager extends SimpleViewManager<MyCustomView> {

    public static final String REACT_CLASS = "RCTMyCustomView";


    @ReactProp(name = "source")
    public void setSource(MyCustomView view, String source) {
        view.setSource(source);
    }

    @Override
    public String getName() { return REACT_CLASS; }

    @Override
    public MyCustomView createViewInstance(ThemedReactContext context) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        MyCustomView view = (MyCustomView)inflater.inflate(R.layout.custom_view, null);
        return view;
    }


    public Map getExportedCustomBubblingEventTypeConstants() {

        String eventName = "onClickEvent";
        String propName = "onClick";
        Map onClickHandler = MapBuilder.of("phasedRegistrationNames",MapBuilder.of("bubbled", propName));

        Builder events = MapBuilder.builder();
        events.put(eventName, onClickHandler);
        return events.build();

    }

}

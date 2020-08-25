// @flow
import React from 'react';
import { requireNativeComponent } from 'react-native';

type Props = {
    status: Boolean,
    source: String,
    onClick: Function
}

const RCTCustomView = requireNativeComponent('RCTMyCustomView', PixelatedImage, {});

class PixelatedImage extends React.PureComponent<Props> {
    _onClick = (event) => {
        if (!this.props.onClick) {
            return;
        }
        // process raw event...
        this.props.onClick(event.nativeEvent);
    }

    render() {
        return <RCTCustomView {...this.props} onClick={this._onClick} />
    }
}

export default PixelatedImage;
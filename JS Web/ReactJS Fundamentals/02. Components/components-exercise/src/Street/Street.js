import React from 'react';
import './Street.css';

const street = function(props) {
    return (
        <div className="Street" onMouseEnter={() => props.streetHoverEvent(props.id)}>
            <p className="street-info">{props.location}</p>
        </div>
    );
}

export default street;